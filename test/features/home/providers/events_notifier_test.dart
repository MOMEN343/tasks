import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/providers/events_notifier.dart';
import 'package:tasks/features/home/providers/events_repository_provider.dart';
import 'package:tasks/features/home/data/repositories/events_repository.dart';

class FakeEventsRepository implements EventsRepository {
  final List<EventModel> events;

  FakeEventsRepository(this.events);

  @override
  Future<List<EventModel>> getEvents() async {
    return events;
  }

  @override
  Future<EventModel> addEvent(EventModel event) async {
    return event;
  }

  @override
  Future<EventModel> updateEvent(EventModel event) async {
    final index = events.indexWhere((e) => e.id == event.id);
    events[index] = event;
    return event;
  }

  @override
  Future<void> deleteEvent(String id) async {
    events.removeWhere((event) => event.id == id);
  }
}

EventModel createEvent({required String id, required String title}) {
  return EventModel(
    id: id,
    title: title,
    image: null,
    address: 'Gaza',
    date: DateTime(2026, 11, 10),
    time: '18:00',
    attendanceCount: 0,
    budget: 0,
    invitedCount: 0,
    giftsCount: 0,
    totalGiftAmount: 0,
    averageGiftValue: 0,
  );
}

void main() {
  test('يجلب ويضيف ويعدل ويحذف المناسبات', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Old Event'),
    ]);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    final initialEvents = await container.read(eventsNotifierProvider.future);

    expect(initialEvents.length, 1);

    await container
        .read(eventsNotifierProvider.notifier)
        .addEvent(createEvent(id: '2', title: 'New Event'));

    expect(container.read(eventsNotifierProvider).requireValue.length, 2);

    await container
        .read(eventsNotifierProvider.notifier)
        .updateEvent(createEvent(id: '1', title: 'Updated Event'));

    final updatedEvents = container.read(eventsNotifierProvider).requireValue;

    expect(updatedEvents.first.title, 'Updated Event');

    await container.read(eventsNotifierProvider.notifier).deleteEvent('2');

    expect(container.read(eventsNotifierProvider).requireValue.length, 1);
  });
}
