import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/home/managers/manager_image.dart';
import 'package:tasks/features/home/models/event_model.dart';

final EventModel event1 = EventModel(
  title: ManagerStrings.ahmedAndFatima,
  image: ManagerImages.event1,
  address: ManagerStrings.eventLocation,
  date: ManagerStrings.firstEventDate,
  time: "6:00 مساء",
  attendanceCount: 180,
  budget: 45,
  invitedCount: 250,
  giftsCount: 80,
  totalGiftAmount: 45000,
  averageGiftValue: 529,
);

final EventModel event2 = EventModel(
  title: ManagerStrings.abdullahAndFathia,
  image: ManagerImages.event2,
  address: ManagerStrings.eventLocation,
  date: ManagerStrings.secondEventDate,
  time: "6:00",
  attendanceCount: 180,
  budget: 45,
  invitedCount: 250,
  giftsCount: 80,
  totalGiftAmount: 45000,
  averageGiftValue: 529,
);

final EventModel event3 = EventModel(
  title: ManagerStrings.salehAndSomaya,
  image: ManagerImages.event3,
  address: ManagerStrings.eventLocation,
  date: ManagerStrings.previousEventDate,
  time: "6:00",
  attendanceCount: 180,
  budget: 45,
  invitedCount: 250,
  giftsCount: 80,
  totalGiftAmount: 45000,
  averageGiftValue: 529,
);
final EventModel event4 = EventModel(
  title: ManagerStrings.abdullahAndFarah,
  image: ManagerImages.event4,
  address: ManagerStrings.eventLocation,
  date: ManagerStrings.previousEventDateTwo,
  time: "6:00",
  attendanceCount: 180,
  budget: 45,
  invitedCount: 250,
  giftsCount: 80,
  totalGiftAmount: 45000,
  averageGiftValue: 529,
);
