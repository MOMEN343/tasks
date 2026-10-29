class EventModel {
  final String title;
  final String id;
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
    required this.id,
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
    return EventModel(
      title: json['title'] as String,
      id: json['id'] as String,
      image: json['image_url'] as String?,
      address: json['address'] as String,
      date: DateTime.parse(json['event_date'] as String),
      time: json['event_time'] as String,
      attendanceCount: json['attendance_count'] as int,
      budget: (json['budget'] as num).toInt(),
      invitedCount: json['invited_count'] as int,
      giftsCount: json['gifts_count'] as int,
      totalGiftAmount: (json['total_gift_amount'] as num).toDouble(),
      averageGiftValue: (json['average_gift_value'] as num).toDouble(),
    );
  }
}
