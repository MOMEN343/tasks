import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/providers/events_repository_provider.dart';

class EventsNotifier extends AsyncNotifier<List<EventModel>> {
  @override
  FutureOr<List<EventModel>> build() {
    return ref.read(eventsRepositoryProvider).getEvents();
  }

  Future<void> addEvent(EventModel event) async {
    final newEvent = await ref.read(eventsRepositoryProvider).addEvent(event);

    state = AsyncData([...state.value!, newEvent]);
  }

  Future<void> updateEvent(EventModel event) async {
    final updatedEvent = await ref
        .read(eventsRepositoryProvider)
        .updateEvent(event);

    final events = state.value!;

    state = AsyncData([
      for (final currentEvent in events)
        if (currentEvent.id == updatedEvent.id) updatedEvent else currentEvent,
    ]);
  }

  Future<void> deleteEvent(String id) async {
    await ref.read(eventsRepositoryProvider).deleteEvent(id);

    final events = state.value!;

    state = AsyncData(events.where((event) => event.id != id).toList());
  }
}

final eventsNotifierProvider =
    AsyncNotifierProvider<EventsNotifier, List<EventModel>>(EventsNotifier.new);
