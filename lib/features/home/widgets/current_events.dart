import 'package:flutter/material.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class CurrentEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 31),
      child: Column(
        spacing: 10,
        children: [
          EventCard(
            image: "card1.png",
            name: "أحمد وفاطمة",
            eventDate: "01-12-2025",
          ),
          EventCard(
            image: "card2.png",
            name: "عبدالله وفتحية",
            eventDate: "03-12-2025",
          ),
          EventCard(image: "card1.png", name: "أحمد وفاطمة", eventDate: "01-12-2025"),
        ],
      ),
    );
  }
}
