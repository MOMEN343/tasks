import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/home/data/event_data.dart';
import 'package:tasks/features/home/managers/manager_image.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class CurrentEvents extends StatelessWidget {
  CurrentEvents({super.key});

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

            eventDate: event1.data,
          ),

          EventCard(
            image: event2.image,
            name: event2.title,
            eventDate: event2.data,
          ),

          EventCard(
            image: event1.image,

            name: event1.title,

            eventDate: event1.data,
          ),
        ],
      ),
    );
  }
}
