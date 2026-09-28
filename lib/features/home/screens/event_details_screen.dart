import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/home/managers/manager_date.dart';
import 'package:tasks/features/home/widgets/attendance_view.dart';
import 'package:tasks/features/home/widgets/gifts_view.dart';
import 'package:tasks/features/home/widgets/statistics_card.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';
import 'package:tasks/features/wallet/widgets/top_part.dart';

class EventDetailsScreen extends StatefulWidget {
  final String title;
  final DateTime date;
  final String time;
  final int attendanceCount;
  final int budget;
  final int invitedCount;
  final int giftsCount;
  final String image;
  final double totalGiftAmount;
  final double averageGiftValue;

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
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreen();
}

class _EventDetailsScreen extends State<EventDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
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
                    title: ManagerStrings.weddingParty(widget.title),
                    subTitle:
                        "${ManagerDate.formatDate(widget.date)} - ${widget.time}",
                    height: 129,
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
                        child: Image.asset("assets/images/${widget.image}"),
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
