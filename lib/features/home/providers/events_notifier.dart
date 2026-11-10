import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/errors/app_exception.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/providers/events_repository_provider.dart';

class EventsNotifier extends AsyncNotifier<List<EventModel>> {
  @override
  FutureOr<List<EventModel>> build() {
    return ref.read(eventsRepositoryProvider).getEvents();
  }

  List<EventModel> _currentEvents() {
    final events = state.asData?.value;

    if (events == null) {
      throw AppException(
        "يرجى الانتظار حتى يتم تحميل المناسبات",
        'state_not_ready',
      );
    }
    return events;
  }

  Future<void> addEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  }) async {
    final events = _currentEvents();

    final newEvent = await ref
        .read(eventsRepositoryProvider)
        .addEvent(
          event,
          imageBytes: imageBytes,
          imageName: imageName,
          imageMimeType: imageMimeType,
        );

    final updatedEvents = [...events, newEvent]
      ..sort((a, b) => a.date.compareTo(b.date));

    state = AsyncData(updatedEvents);
  }

  Future<void> updateEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  }) async {
    final events = _currentEvents();

    final updatedEvent = await ref
        .read(eventsRepositoryProvider)
        .updateEvent(
          event,
          imageBytes: imageBytes,
          imageName: imageName,
          imageMimeType: imageMimeType,
        );

    final updatedEvents = [
      for (final currentEvent in events)
        if (currentEvent.id == updatedEvent.id) updatedEvent else currentEvent,
    ]..sort((a, b) => a.date.compareTo(b.date));

    state = AsyncData(updatedEvents);
  }

  Future<void> deleteEvent(String id) async {
    final events = _currentEvents();

    await ref.read(eventsRepositoryProvider).deleteEvent(id);

    state = AsyncData(events.where((event) => event.id != id).toList());
  }
}

final eventsNotifierProvider =
    AsyncNotifierProvider<EventsNotifier, List<EventModel>>(EventsNotifier.new);
