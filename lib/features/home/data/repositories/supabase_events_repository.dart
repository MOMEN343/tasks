import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks/core/errors/app_exception.dart';
import 'package:tasks/features/home/data/repositories/events_repository.dart';
import 'package:tasks/features/home/models/event_model.dart';

class SupabaseEventsRepository implements EventsRepository {
  final SupabaseClient client;

  SupabaseEventsRepository(this.client);

  @override
  Future<EventModel> addEvent(EventModel event) async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      throw AppException("يجب تسجيل الدخول أولاً", "session");
    }
    try {
      final response = await client
          .from('events')
          .insert({...event.toJson(), "user_id": currentUser.id})
          .select()
          .single();

      return EventModel.fromJson(response);
    } on SocketException {
      throw AppException("تحقق من اتصالك بالإنترنت وحاول مرة أخرى", "network");
    } on AuthException {
      throw AppException("تعذّر التحقق من حسابك", "session");
    } on PostgrestException {
      throw AppException("تعذر إضافة مناسبة", "add_event");
    } catch (e) {
      debugPrint('addEvent error: $e');
      throw AppException(
        "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.",
        "unknown",
      );
    }
  }

  @override
  Future<void> deleteEvent(String id) async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      throw AppException("يجب تسجيل الدخول أولاً", "session");
    }
    try {
      await client.from('events').delete().eq('id', id);
    } on SocketException {
      throw AppException("تحقق من اتصالك بالإنترنت وحاول مرة أخرى", "network");
    } on AuthException {
      throw AppException("تعذّر التحقق من حسابك", "session");
    } on PostgrestException {
      throw AppException("تعذر حذف مناسبة", "delete_event");
    } catch (e) {
      debugPrint('deleteEvent error: $e');
      throw AppException(
        "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.",
        "unknown",
      );
    }
  }

  @override
  Future<List<EventModel>> getEvents() async {
    final currentUser = client.auth.currentUser;

    if (currentUser == null) {
      throw AppException("يجب تسجيل الدخول أولاً", "session");
    }

    try {
      final response = await client
          .from("events")
          .select()
          .eq('user_id', currentUser.id)
          .order('event_date');

      return response.map((event) => EventModel.fromJson(event)).toList();
    } on SocketException {
      throw AppException("تحقق من اتصالك بالإنترنت وحاول مرة أخرى", "network");
    } on AuthException {
      throw AppException("تعذّر التحقق من حسابك", "session");
    } on PostgrestException {
      throw AppException("تعذر جلب المناسبات", "get_events");
    } catch (e) {
      debugPrint('getEvents error: $e');
      throw AppException(
        "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.",
        "unknown",
      );
    }
  }

  @override
  Future<EventModel> updateEvent(EventModel event) async {
    final currentUser = client.auth.currentUser;
    if (currentUser == null) {
      throw AppException("يجب تسجيل الدخول أولاً", "session");
    }
    try {
      final response = await client
          .from('events')
          .update(event.toJson())
          .eq("id", event.id!)
          .select()
          .single();

      return EventModel.fromJson(response);
    } on SocketException {
      throw AppException("تحقق من اتصالك بالإنترنت وحاول مرة أخرى", "network");
    } on AuthException {
      throw AppException("تعذّر التحقق من حسابك", "session");
    } on PostgrestException {
      throw AppException("تعذر تعديل المناسبة", "update_event");
    } catch (e) {
      debugPrint('updateEvent error: $e');
      throw AppException(
        "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.",
        "unknown",
      );
    }
  }
}
