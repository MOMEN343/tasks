class EventModel {
  final String title;
  final String image;
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
    required this.image,
    required this.address,
    required this.date,
    required this.time,
    required this.attendanceCount,
    required this.budget,
    required this.invitedCount,
    required this.giftsCount,
    required this.totalGiftAmount, required this.averageGiftValue,
  });
}
