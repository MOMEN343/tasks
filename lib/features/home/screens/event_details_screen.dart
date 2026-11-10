import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/home/managers/manager_date.dart';
import 'package:tasks/features/home/models/event_model.dart';
import 'package:tasks/features/home/providers/events_notifier.dart';
import 'package:tasks/features/home/screens/add_event.dart';
import 'package:tasks/features/home/widgets/attendance_view.dart';
import 'package:tasks/features/home/widgets/gifts_view.dart';
import 'package:tasks/features/home/widgets/statistics_card.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';
import 'package:tasks/features/wallet/widgets/top_part.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  final String eventId;
  final String title;
  final DateTime date;
  final String time;
  final int attendanceCount;
  final int budget;
  final int invitedCount;
  final int giftsCount;
  final String? image;
  final double totalGiftAmount;
  final double averageGiftValue;
  final String address;

  const EventDetailsScreen({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.attendanceCount,
    required this.budget,
    required this.invitedCount,
    required this.giftsCount,
    required this.image,
    required this.totalGiftAmount,
    required this.averageGiftValue,
    required this.eventId,
    required this.address,
  });

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreen();
}

class _EventDetailsScreen extends ConsumerState<EventDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> editEvent() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => AddEvent(
          event: EventModel(
            id: widget.eventId,
            title: widget.title,
            image: widget.image,
            address: widget.address,
            date: widget.date,
            time: widget.time,
            attendanceCount: widget.attendanceCount,
            budget: widget.budget,
            invitedCount: widget.invitedCount,
            giftsCount: widget.giftsCount,
            totalGiftAmount: widget.totalGiftAmount,
            averageGiftValue: widget.averageGiftValue,
          ),
        ),
      ),
    );

    if (result == true && mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> deleteEvent() async {
    try {
      await ref
          .read(eventsNotifierProvider.notifier)
          .deleteEvent(widget.eventId);

      if (!mounted) return;

      Navigator.of(context).pop();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم حذف المناسبة بنجاح')));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('فشل حذف المناسبة: $e')));
    }
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            spacing: 15,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  TopPart(
                    title: widget.title,
                    subTitle:
                        "${ManagerDate.formatDate(widget.date)} - ${widget.time}",
                    height: 129,
                  ),

                  Positioned(
                    top: 20,
                    left: 60,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: editEvent,
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 15,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (context) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  title: const Text('حذف المناسبة'),
                                  content: const Text(
                                    'هل أنت متأكد من حذف المناسبة؟',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('إلغاء'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text('حذف'),
                                    ),
                                  ],
                                ),
                              ),
                            );

                            if (confirmed == true) {
                              await deleteEvent();
                            }
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatisticsCard(
                            icon: Icon(
                              Icons.people_alt_outlined,
                              size: 24,
                              color: ManagerColors.secondary,
                            ),
                            value: widget.attendanceCount.toString(),
                            label: ManagerStrings.confirmedAttendance,
                          ),
                          StatisticsCard(
                            icon: Icon(
                              Icons.card_giftcard_sharp,
                              size: 24,
                              color: ManagerColors.secondary,
                            ),
                            value: widget.giftsCount.toString(),
                            label: ManagerStrings.gifts,
                          ),
                          StatisticsCard(
                            icon: RyalImage(
                              color: ManagerColors.secondary,
                              size: 20,
                            ),
                            value: "K${widget.budget.toString()}",
                            label: ManagerStrings.ryal,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    spacing: 10,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: widget.image != null && widget.image!.isNotEmpty
                            ? Image.network(
                                widget.image!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported);
                                },
                              )
                            : const Icon(Icons.image_not_supported),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: const Color(0xFFF4F4F4),
                          child: TabBar(
                            controller: tabController,
                            indicator: BoxDecoration(
                              color: ManagerColors.secondary,
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            dividerColor: Colors.transparent,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            labelStyle: TextStyle(fontWeight: FontWeight.w700),
                            unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                            tabs: [
                              Tab(text: ManagerStrings.attendanceDetails),
                              Tab(text: ManagerStrings.giftsDetails),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            AttendanceView(
                              attendanceCount: "250/${widget.attendanceCount}",
                              apologiesCount: "30",
                              awaitingReplyCount: "40",
                            ),
                            GiftsView(
                              totalGiftAmount: widget.totalGiftAmount,
                              giftsCount: widget.giftsCount,
                              averageGiftValue: widget.averageGiftValue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
