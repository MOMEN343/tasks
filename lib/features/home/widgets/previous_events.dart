import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/features/home/data/event_data.dart';
import 'package:tasks/features/home/data/events_service.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class PreviousEvents extends StatefulWidget {
  const PreviousEvents({super.key});

  @override
  State<PreviousEvents> createState() => _PreviousEvents();
}

class _PreviousEvents extends State<PreviousEvents> {
  final today = DateUtils.dateOnly(DateTime.now());
  List<EventModel> previousEvents = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getPreviousEvents();
  }

  Future getPreviousEvents() async {
    try {
      final response = await EventsService().getEvents();

      if (!mounted) return;
      setState(() {
        previousEvents = response;
        previousEvents = previousEvents.where((event) {
          return DateUtils.dateOnly(event.date).isBefore(today);
        }).toList();
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      errorMessage = e.toString();
      debugPrint(errorMessage);
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 31),

      child: Column(
        spacing: 10,

        children: [
          if (isLoading)
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: 180,
                color: Colors.white,
              ),
            )
          else if (errorMessage != null)
            Text("Error: $errorMessage")
          else if (previousEvents.isEmpty)
            Text("لا توجد مناسبات سابقة ..")
          else
            ...previousEvents.map(
              (event) => EventCard(
                eventEnded: true,
                image: event.image,
                name: event.title,
                eventDate: event.date,
                time: event.time,
                attendanceCount: event.attendanceCount,
                budget: event.budget,
                invitedCount: event.invitedCount,
                giftsCount: event.giftsCount,
                totalGiftAmount: event.totalGiftAmount,
                averageGiftValue: event.averageGiftValue,
                address: event.address,
              ),
            ),
        ],
      ),
    );
  }
}
