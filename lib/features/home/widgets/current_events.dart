import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasks/features/home/data/event_data.dart';
import 'package:tasks/features/home/data/events_service.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class CurrentEvents extends StatefulWidget {
  final int refreshKey;

  const CurrentEvents({super.key, required this.refreshKey});

  @override
  State<CurrentEvents> createState() => _CurrentEvents();
}

class _CurrentEvents extends State<CurrentEvents> {
  List<EventModel> events = [];
  bool isLoading = true;
  String? errorMessage;
  final today = DateUtils.dateOnly(DateTime.now());

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  void didUpdateWidget(covariant CurrentEvents oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.refreshKey != widget.refreshKey) {
      getEvents();
    }
  }

  Future getEvents() async {
    try {
      final response = await EventsService().getEvents();

      if (!mounted) return;
      setState(() {
        events = response;
        events = events.where((event) {
          return !DateUtils.dateOnly(event.date).isBefore(today);
        }).toList();
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
        debugPrint(errorMessage.toString());
        isLoading = false;
      });
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
            const Center(child: CircularProgressIndicator())
          else if (errorMessage != null)
            Text('حدث خطأ: $errorMessage')
          else if (events.isEmpty)
            const Center(child: Text('لا توجد مناسبات حاليًا'))
          else
            ...events.map(
              (event) => EventCard(
                image: event.image,
                name: event.title,
                address: event.address,
                eventDate: event.date,
                time: event.time,
                attendanceCount: event.attendanceCount,
                budget: event.budget,
                invitedCount: event.invitedCount,
                giftsCount: event.giftsCount,
                totalGiftAmount: event.totalGiftAmount,
                averageGiftValue: event.averageGiftValue,
              ),
            ),
        ],
      ),
    );
  }
}
