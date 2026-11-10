import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/core/errors/app_exception.dart';
import 'package:tasks/features/home/data/repositories/events_repository.dart';
import 'package:tasks/features/home/models/event_model.dart';

class SupabaseEventsRepository implements EventsRepository {
  final SupabaseClient client;

  SupabaseEventsRepository(this.client);

  static const String _bucketName = 'event-images';

  AppException _handlePostgrestError(
    PostgrestException error,
    String operation,
  ) {
    if (error.code == '42501') {
      return AppException('ليست لديك صلاحية لتنفيذ هذه العملية', 'permission');
    }

    if (error.code == 'PGRST301') {
      return AppException(
        'انتهت جلسة تسجيل الدخول، يرجى تسجيل الدخول مجدداً',
        'session',
      );
    }

    final message = switch (operation) {
      'add_event' => 'تعذر إضافة المناسبة',
      'update_event' => 'تعذر تعديل المناسبة',
      'delete_event' => 'تعذر حذف المناسبة',
      _ => 'تعذر جلب المناسبات',
    };

    return AppException(message, operation);
  }

  AppException _handleError(Object error, String operation) {
    if (error is AppException) return error;

    if (error is SocketException || error is AuthRetryableFetchException) {
      return AppException('تحقق من اتصالك بالإنترنت وحاول مرة أخرى', 'network');
    }

    if (error is AuthException) {
      return AppException(
        'انتهت جلسة تسجيل الدخول، يرجى تسجيل الدخول مجدداً',
        'session',
      );
    }

    if (error is PostgrestException) {
      return _handlePostgrestError(error, operation);
    }

    if (error is StorageException) {
      return AppException(
        'تعذر التعامل مع صورة المناسبة، حاول مرة أخرى',
        'storage',
      );
    }

    debugPrint('$operation error: $error');

    return AppException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى', 'unknown');
  }

  Future<({String path, String url})?> _uploadImage({
    required Uint8List? imageBytes,
    required String? imageName,
    required String? imageMimeType,
  }) async {
    if (imageBytes == null) return null;

    final user = client.auth.currentUser;

    if (user == null) {
      throw AppException('يجب تسجيل الدخول أولاً', 'session');
    }

    final extension = imageName != null && imageName.contains('.')
        ? imageName.split('.').last.toLowerCase()
        : 'jpg';
    final path =
        '${user.id}/${DateTime.now().millisecondsSinceEpoch}.$extension';

    await client.storage
        .from(_bucketName)
        .uploadBinary(
          path,
          imageBytes,
          fileOptions: FileOptions(contentType: imageMimeType),
        );

    final url = client.storage.from(_bucketName).getPublicUrl(path);

    return (path: path, url: url);
  }

  String? _getImagePath(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) return null;

    final uri = Uri.tryParse(imageUrl);
    if (uri == null) return null;

    final segments = uri.pathSegments;
    final bucketIndex = segments.indexOf(_bucketName);

    if (bucketIndex == -1 || bucketIndex == segments.length - 1) {
      return null;
    }

    return segments.skip(bucketIndex + 1).join('/');
  }

  Future<void> _removeImage(String? path) async {
    if (path == null || path.isEmpty) return;

    try {
      await client.storage.from(_bucketName).remove([path]);
    } catch (e) {
      debugPrint('تعذر حذف صورة المناسبة: $e');
    }
  }

  @override
  Future<EventModel> addEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  }) async {
    final currentUser = client.auth.currentUser;

    if (currentUser == null) {
      throw AppException('يجب تسجيل الدخول أولاً', 'session');
    }

    String? uploadedPath;

    try {
      final uploadedImage = await _uploadImage(
        imageBytes: imageBytes,
        imageName: imageName,
        imageMimeType: imageMimeType,
      );

      uploadedPath = uploadedImage?.path;

      final response = await client
          .from('events')
          .insert({
            ...event.toJson(),
            if (uploadedImage != null) 'image_url': uploadedImage.url,
            'user_id': currentUser.id,
          })
          .select()
          .single();

      return EventModel.fromJson(response);
    } catch (e) {
      await _removeImage(uploadedPath);
      throw _handleError(e, 'add_event');
    }
  }

  @override
  Future<EventModel> updateEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  }) async {
    if (client.auth.currentUser == null) {
      throw AppException('يجب تسجيل الدخول أولاً', 'session');
    }

    if (event.id == null) {
      throw AppException('معرّف المناسبة غير موجود', 'update_event');
    }

    String? uploadedPath;

    try {
      final uploadedImage = await _uploadImage(
        imageBytes: imageBytes,
        imageName: imageName,
        imageMimeType: imageMimeType,
      );

      uploadedPath = uploadedImage?.path;

      final response = await client
          .from('events')
          .update({
            ...event.toJson(),
            if (uploadedImage != null) 'image_url': uploadedImage.url,
          })
          .eq('id', event.id!)
          .select()
          .maybeSingle();

      if (response == null) {
        throw AppException(
          'لم يتم تعديل المناسبة، تحقق من الصلاحيات',
          'update_failed',
        );
      }

      final updatedEvent = EventModel.fromJson(response);

      if (uploadedImage != null) {
        await _removeImage(_getImagePath(event.image));
      }

      return updatedEvent;
    } catch (e) {
      await _removeImage(uploadedPath);
      throw _handleError(e, 'update_event');
    }
  }

  @override
  Future<void> deleteEvent(String id) async {
    if (client.auth.currentUser == null) {
      throw AppException('يجب تسجيل الدخول أولاً', 'session');
    }

    try {
      final event = await client
          .from('events')
          .select('image_url')
          .eq('id', id)
          .maybeSingle();

      final response = await client
          .from('events')
          .delete()
          .eq('id', id)
          .select();

      if (response.isEmpty) {
        throw AppException(
          'لم يتم حذف المناسبة، تحقق من الصلاحيات',
          'delete_failed',
        );
      }

      await _removeImage(_getImagePath(event?['image_url'] as String?));
    } catch (e) {
      throw _handleError(e, 'delete_event');
    }
  }

  @override
  Future<List<EventModel>> getEvents() async {
    final currentUser = client.auth.currentUser;

    if (currentUser == null) {
      throw AppException('يجب تسجيل الدخول أولاً', 'session');
    }

    try {
      final response = await client
          .from('events')
          .select()
          .eq('user_id', currentUser.id)
          .order('event_date');

      final events = <EventModel>[];

      for (final row in response) {
        try {
          events.add(EventModel.fromJson(row));
        } catch (e) {
          debugPrint('تم تجاهل سجل مناسبة غير صالح: $e');
        }
      }

      return events;
    } catch (e) {
      throw _handleError(e, 'get_events');
    }
  }
}
