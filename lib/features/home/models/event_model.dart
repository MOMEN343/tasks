class EventModel {
  final String title;
  final String? id;
  final String? image;
  final String address;
  final DateTime date;
  final String time;
  final int attendanceCount;
  final int budget;
  final int invitedCount;
  final int giftsCount;
  final double totalGiftAmount;
  final double averageGiftValue;

  EventModel({
    required this.title,
    this.id,
    required this.image,
    required this.address,
    required this.date,
    required this.time,
    required this.attendanceCount,
    required this.budget,
    required this.invitedCount,
    required this.giftsCount,
    required this.totalGiftAmount,
    required this.averageGiftValue,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    final parsedDate = DateTime.tryParse(json['event_date']?.toString() ?? '');

    if (parsedDate == null) {
      throw const FormatException('تاريخ المناسبة غير صالح');
    }

    int parseInt(dynamic value) {
      if (value is num) return value.toInt();
      return int.tryParse(value?.toString() ?? '') ?? 0;
    }

    double parseDouble(dynamic value) {
      if (value is num) return value.toDouble();
      return double.tryParse(value?.toString() ?? '') ?? 0.0;
    }

    return EventModel(
      title: json['title']?.toString() ?? '',
      id: json['id']?.toString(),
      image: json['image_url']?.toString(),
      address: json['address']?.toString() ?? '',
      date: parsedDate,
      time: json['event_time']?.toString() ?? '',
      attendanceCount: parseInt(json['attendance_count']),
      budget: parseInt(json['budget']),
      invitedCount: parseInt(json['invited_count']),
      giftsCount: parseInt(json['gifts_count']),
      totalGiftAmount: parseDouble(json['total_gift_amount']),
      averageGiftValue: parseDouble(json['average_gift_value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "image_url": image,
      "address": address,
      "event_date": date.toIso8601String().split('T')[0],
      "event_time": time,
      "attendance_count": attendanceCount,
      "budget": budget,
      "invited_count": invitedCount,
      "gifts_count": giftsCount,
      "total_gift_amount": totalGiftAmount,
      "average_gift_value": averageGiftValue,
    };
  }
}
