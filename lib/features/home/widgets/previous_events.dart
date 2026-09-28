import 'package:flutter/material.dart';

import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/home/data/event_data.dart';
import 'package:tasks/features/home/managers/manager_image.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class PreviousEvents extends StatelessWidget {
  const PreviousEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 31),

      child: Column(
        spacing: 10,

        children: [
          EventCard(
            image: event3.image,
            name: event3.title,
            eventDate: event3.date,
            eventEnded: true,
            time: event3.time,
            attendanceCount: event3.attendanceCount,
            budget: event3.budget,
            invitedCount: event3.invitedCount,
            giftsCount: event3.giftsCount,
            totalGiftAmount: event3.totalGiftAmount,
            averageGiftValue: event3.averageGiftValue
          ),

          EventCard(
            image: event4.image,

            name: event4.title,

            eventDate: event4.date,

            eventEnded: true,
            time: event4.time,
            attendanceCount: event4.attendanceCount,
            budget: event4.budget,
            invitedCount: event4.invitedCount,
            giftsCount: event4.giftsCount,
            totalGiftAmount: event4.totalGiftAmount,
            averageGiftValue: event4.averageGiftValue
          ),

          EventCard(
            image: event3.image,
            name: event3.title,
            eventDate: event3.date,
            eventEnded: true,
            time: event3.time,
            attendanceCount: event3.attendanceCount,
            budget: event3.budget,
            invitedCount: event3.invitedCount,
            giftsCount: event3.giftsCount,
            totalGiftAmount: event3.totalGiftAmount,
            averageGiftValue: event3.averageGiftValue
          ),
        ],
      ),
    );
  }
}
