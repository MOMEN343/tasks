import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/utils/event_filter.dart';

void main() {
  final today = DateUtils.dateOnly(DateTime.now());

  EventModel createEvent(DateTime date) {
    return EventModel(
      title: 'عنوان اختباري',
      image: null,
      address: 'غزة',
      date: date,
      time: '18:00',
      attendanceCount: 0,
      budget: 0,
      invitedCount: 0,
      giftsCount: 0,
      totalGiftAmount: 0,
      averageGiftValue: 0,
    );
  }

  group('Event Filter Tests', () {
    test('المناسبة بتاريخ اليوم تظهر ضمن المناسبات الحالية', () {
      final events = [createEvent(today)];

      final result = getCurrentEvents(events);

      expect(result.length, 1);
    });

    test('المناسبة بتاريخ أمس تظهر ضمن المناسبات السابقة', () {
      final yesterday = today.subtract(const Duration(days: 1));
      final events = [createEvent(yesterday)];

      final result = getPreviousEvents(events);

      expect(result.length, 1);
    });

    test('المناسبة بتاريخ الغد تظهر ضمن المناسبات الحالية', () {
      final tomorrow = today.add(const Duration(days: 1));
      final events = [createEvent(tomorrow)];

      final result = getCurrentEvents(events);

      expect(result.length, 1);
    });

    test('المناسبة السابقة لا تظهر ضمن المناسبات الحالية', () {
      final yesterday = today.subtract(const Duration(days: 1));
      final events = [createEvent(yesterday)];

      final result = getCurrentEvents(events);

      expect(result, isEmpty);
    });
  });
}
