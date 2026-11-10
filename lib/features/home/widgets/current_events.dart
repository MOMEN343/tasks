import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/features/home/utils/event_filter.dart';
import 'package:tasks/features/home/widgets/event_card.dart';
import 'package:tasks/features/home/providers/events_notifier.dart';
import 'package:tasks/core/errors/app_exception.dart';

class CurrentEvents extends ConsumerStatefulWidget {
  const CurrentEvents({super.key});

  @override
  ConsumerState<CurrentEvents> createState() => _CurrentEvents();
}

class _CurrentEvents extends ConsumerState<CurrentEvents> {
  @override
  Widget build(BuildContext context) {
    final eventsAsync = ref.watch(eventsNotifierProvider);

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 31),
      child: eventsAsync.when(
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 180,
            color: Colors.white,
          ),
        ),
        error: (error, stackTrace) {
          final message = error is AppException
              ? error.message
              : 'حدث خطأ، يرجى المحاولة مرة أخرى';

          return Text('حدث خطأ: $message');
        },

        data: (allEvents) {
          final events = getCurrentEvents(allEvents);

          if (events.isEmpty) {
            return const Center(child: Text('لا توجد مناسبات حالياً'));
          }
          return Column(
            spacing: 10,
            children: events
                .map(
                  (event) => EventCard(
                    id: event.id!,
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
                )
                .toList(),
          );
        },
      ),
    );
  }
}
