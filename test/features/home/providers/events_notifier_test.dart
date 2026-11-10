import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/errors/app_exception.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/providers/events_notifier.dart';
import 'package:tasks/features/home/providers/events_repository_provider.dart';
import 'package:tasks/features/home/data/repositories/events_repository.dart';

class FakeEventsRepository implements EventsRepository {
  final List<EventModel> events;
  bool failAdd;
  bool failDelete;
  bool failGet;
  bool failUpdate;

  FakeEventsRepository(
    this.events, {
    this.failAdd = false,
    this.failDelete = false,
    this.failGet = false,
    this.failUpdate = false,
  });

  @override
  Future<List<EventModel>> getEvents() async {
    if (failGet) {
      throw AppException('فشل جلب المناسبات', 'get_events');
    }
    return [...events];
  }

  @override
  @override
  Future<EventModel> addEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  }) async {
    if (failAdd) {
      throw AppException('فشل إضافة المناسبة', 'add_event');
    }
    return event;
  }

  @override
  Future<EventModel> updateEvent(
    EventModel event, {
    Uint8List? imageBytes,
    String? imageName,
    String? imageMimeType,
  }) async {
    if (failUpdate) {
      throw AppException('فشل تعديل المناسبة', 'update_event');
    }
    return event;
  }

  @override
  Future<void> deleteEvent(String id) async {
    if (failDelete) {
      throw AppException('فشل حذف المناسبة', 'delete_event');
    }
  }
}

EventModel createEvent({
  required String id,
  required String title,
  DateTime? date,
}) {
  return EventModel(
    id: id,
    title: title,
    image: null,
    address: 'Gaza',
    date: date ?? DateTime(2026, 11, 10),
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
  test('يجلب المناسبات بنجاح', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Event 1'),
    ]);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    final events = await container.read(eventsNotifierProvider.future);

    expect(events.length, 1);
  });

  test('يعرض حالة الخطأ عند فشل الجلب', () async {
    final repository = FakeEventsRepository([], failGet: true);

    final container = ProviderContainer(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    addTearDown(container.dispose);

    final completer = Completer<void>();

    final subscription = container.listen(eventsNotifierProvider, (
      previous,
      next,
    ) {
      if (next.hasError && !completer.isCompleted) {
        completer.complete();
      }
    });

    container.read(eventsNotifierProvider);

    await completer.future.timeout(const Duration(seconds: 5));

    final state = container.read(eventsNotifierProvider);

    expect(state.hasError, isTrue);
    expect(state.error, isA<AppException>());

    subscription.close();
  });

  test('يضيف المناسبة ويرتب القائمة حسب التاريخ', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Later', date: DateTime(2026, 11, 12)),
    ]);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    await container.read(eventsNotifierProvider.future);

    await container
        .read(eventsNotifierProvider.notifier)
        .addEvent(
          createEvent(id: '2', title: 'Earlier', date: DateTime(2026, 11, 9)),
        );

    final events = container.read(eventsNotifierProvider).requireValue;

    expect(events.first.id, '2');
    expect(events.last.id, '1');
  });

  test('فشل الإضافة لا يغير القائمة', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Event 1'),
    ], failAdd: true);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    await container.read(eventsNotifierProvider.future);

    await expectLater(
      container
          .read(eventsNotifierProvider.notifier)
          .addEvent(createEvent(id: '2', title: 'Event 2')),
      throwsA(isA<AppException>()),
    );

    expect(container.read(eventsNotifierProvider).requireValue.length, 1);
  });

  test('يعدل المناسبة', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Old title'),
    ]);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    await container.read(eventsNotifierProvider.future);

    await container
        .read(eventsNotifierProvider.notifier)
        .updateEvent(createEvent(id: '1', title: 'New title'));

    expect(
      container.read(eventsNotifierProvider).requireValue.first.title,
      'New title',
    );
  });

  test('يحذف المناسبة', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Event 1'),
      createEvent(id: '2', title: 'Event 2'),
    ]);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    await container.read(eventsNotifierProvider.future);

    await container.read(eventsNotifierProvider.notifier).deleteEvent('1');

    final events = container.read(eventsNotifierProvider).requireValue;

    expect(events.length, 1);
    expect(events.first.id, '2');
  });

  test('فشل الحذف لا يغير القائمة', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Event 1'),
    ], failDelete: true);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    await container.read(eventsNotifierProvider.future);

    await expectLater(
      container.read(eventsNotifierProvider.notifier).deleteEvent('1'),
      throwsA(isA<AppException>()),
    );

    expect(container.read(eventsNotifierProvider).requireValue.length, 1);
  });

  test('فشل التعديل لا يغير القائمة', () async {
    final repository = FakeEventsRepository([
      createEvent(id: '1', title: 'Old title'),
    ], failUpdate: true);

    final container = ProviderContainer.test(
      overrides: [eventsRepositoryProvider.overrideWithValue(repository)],
    );

    await container.read(eventsNotifierProvider.future);

    await expectLater(
      container
          .read(eventsNotifierProvider.notifier)
          .updateEvent(createEvent(id: '1', title: 'New title')),
      throwsA(isA<AppException>()),
    );

    expect(
      container.read(eventsNotifierProvider).requireValue.first.title,
      'Old title',
    );
  });
}
