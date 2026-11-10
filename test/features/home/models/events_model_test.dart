import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/features/home/models/event_model.dart';

void main() {
  group('EventModel.fromJson', () {
    test('يحوّل بيانات المناسبة بشكل صحيح', () {
      final json = {
        'id': 'event-1',
        'title': 'Wedding',
        'image_url': 'https://example.com/image.jpg',
        'address': 'Gaza',
        'event_date': '2026-11-09',
        'event_time': '18:00',
        'attendance_count': 10,
        'budget': 500,
        'invited_count': 20,
        'gifts_count': 5,
        'total_gift_amount': 1000.0,
        'average_gift_value': 200.0,
      };

      final event = EventModel.fromJson(json);

      expect(event.id, 'event-1');
      expect(event.title, 'Wedding');
      expect(event.image, 'https://example.com/image.jpg');
      expect(event.address, 'Gaza');
      expect(event.date, DateTime(2026, 11, 9));
      expect(event.time, '18:00');
      expect(event.attendanceCount, 10);
      expect(event.budget, 500);
      expect(event.invitedCount, 20);
      expect(event.giftsCount, 5);
      expect(event.totalGiftAmount, 1000.0);
      expect(event.averageGiftValue, 200.0);
    });

    test('يتعامل مع الحقول النصية والصورة الفارغة', () {
      final json = {
        'id': null,
        'title': null,
        'image_url': null,
        'address': null,
        'event_date': '2026-11-09',
        'event_time': null,
        'attendance_count': 0,
        'budget': 0,
        'invited_count': 0,
        'gifts_count': 0,
        'total_gift_amount': 0.0,
        'average_gift_value': 0.0,
      };

      final event = EventModel.fromJson(json);

      expect(event.id, isNull);
      expect(event.title, '');
      expect(event.image, isNull);
      expect(event.address, '');
      expect(event.time, '');
    });
  });
}
