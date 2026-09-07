import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_strings.dart';
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
            image: "card1.png",

            name: ManagerStrings.ahmedAndFatima,

            eventDate: ManagerStrings.firstEventDate,
          ),

          EventCard(
            image: "card2.png",

            name: ManagerStrings.abdullahAndFathia,

            eventDate: ManagerStrings.secondEventDate,
          ),

          EventCard(
            image: "card1.png",
            name: ManagerStrings.ahmedAndFatima,
            eventDate: ManagerStrings.firstEventDate,
          ),
        ],
      ),
    );
  }
}
