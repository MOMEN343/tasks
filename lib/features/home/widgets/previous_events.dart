import 'package:flutter/material.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class PreviousEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 31),
      child: Column(
        spacing: 10,
        children: [
          EventCard(
            image: "card3.png",
            name: "صالح وسمية",
            eventDate: "24-9-2025",
            eventEnded: true,
          ),
          EventCard(
            image: "card4.png",
            name: "عبدالله وفرح",
            eventDate: "19-9-2025",
            eventEnded: true,
          ),
          EventCard(
            image: "card3.png",
            name: "أحمد وفاطمة",
            eventDate: "24-9-2025",
            eventEnded: true,
          ),
        ],
      ),
    );
  }
}
