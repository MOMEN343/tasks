import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/errors/app_exception.dart';
import 'package:tasks/features/home/providers/events_notifier.dart';
import 'package:tasks/features/home/utils/event_filter.dart';
import 'package:tasks/features/home/widgets/event_card.dart';

class PreviousEvents extends ConsumerStatefulWidget {
  const PreviousEvents({super.key});

  @override
  ConsumerState<PreviousEvents> createState() => _PreviousEvents();
}

class _PreviousEvents extends ConsumerState<PreviousEvents> {
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
          final previousEvents = getPreviousEvents(allEvents);
          if (previousEvents.isEmpty) {
            return const Center(child: Text('لا توجد مناسبات حالياً'));
          }
          return Column(
            children: previousEvents
                .map(
                  (event) => EventCard(
                    id: event.id!,
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
                )
                .toList(),
          );
        },
      ),
    );
  }
}
