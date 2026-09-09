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
            eventDate: event3.data,
            eventEnded: true,
          ),

          EventCard(
            image: event4.image,

            name: event4.title,

            eventDate: event4.data,

            eventEnded: true,
          ),

          EventCard(
            image: event3.image,
            name: event3.title,
            eventDate: event3.data,
            eventEnded: true,
          ),
        ],
      ),
    );
  }
}
