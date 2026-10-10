import 'package:flutter/material.dart';
import 'package:tasks/features/home/data/event_data.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class CurrentEvents extends StatelessWidget {
  const CurrentEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 31),
      child: Column(
        spacing: 10,
        children: [
          EventCard(
            image: event1.image,

            name: event1.title,

            eventDate: event1.date,
            time: event1.time,
            attendanceCount: event1.attendanceCount,
            budget: event1.budget,
            invitedCount: event1.invitedCount,
            giftsCount: event1.giftsCount,
            totalGiftAmount: event1.totalGiftAmount,
            averageGiftValue: event1.averageGiftValue,
          ),

          EventCard(
            image: event2.image,
            name: event2.title,
            eventDate: event2.date,
            time: event2.time,
            attendanceCount: event2.attendanceCount,
            budget: event2.budget,
            invitedCount: event2.invitedCount,
            giftsCount: event2.giftsCount,
            totalGiftAmount: event2.totalGiftAmount,
            averageGiftValue: event2.averageGiftValue,
          ),

          EventCard(
            image: event1.image,

            name: event1.title,

            eventDate: event1.date,
            time: event1.time,
            attendanceCount: event1.attendanceCount,
            budget: event1.budget,
            invitedCount: event1.invitedCount,
            giftsCount: event1.giftsCount,
            totalGiftAmount: event1.totalGiftAmount,
            averageGiftValue: event1.averageGiftValue,
          ),
        ],
      ),
    );
  }
}
