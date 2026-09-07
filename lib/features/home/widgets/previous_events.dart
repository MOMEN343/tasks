import 'package:flutter/material.dart';

import 'package:tasks/core/managers/manager_strings.dart';
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
            image: "card3.png",

            name: ManagerStrings.salehAndSomaya,

            eventDate: ManagerStrings.previousEventDate,

            eventEnded: true,
          ),

          EventCard(
            image: "card4.png",

            name: ManagerStrings.abdullahAndFarah,

            eventDate: ManagerStrings.previousEventDateTwo,

            eventEnded: true,
          ),

          EventCard(
            image: "card3.png",

            name: ManagerStrings.ahmedAndFatima,

            eventDate: ManagerStrings.previousEventDate,

            eventEnded: true,
          ),
        ],
      ),
    );
  }
}
