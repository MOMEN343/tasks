import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/core/widgets/login_button.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/widgets/count_bar.dart';

class AttendanceView extends StatelessWidget {
  final String attendanceCount;
  final String apologiesCount;
  final String awaitingReplyCount;

  const AttendanceView({
    super.key,
    required this.attendanceCount,
    required this.apologiesCount,
    required this.awaitingReplyCount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ManagerStrings.invitationsStatus,
                            style: ManagerTextStyles.label,
                          ),
                          Text(
                            ManagerStrings.invitationsStatusSubTitle,
                            style: ManagerTextStyles.subCardTitle,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ManagerColors.primary,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/carbon_event.svg",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      CountBar(
                        count: 180,
                        color: ManagerColors.primary,
                        countNumber: attendanceCount,
                        label: ManagerStrings.confirmedAttendance,
                      ),
                      CountBar(
                        count: 30,
                        color: ManagerColors.red,
                        countNumber: apologiesCount,
                        label: ManagerStrings.apologies,
                      ),
                      CountBar(
                        count: 40,
                        color: ManagerColors.grey,
                        countNumber: awaitingReplyCount,
                        label: ManagerStrings.awaitingReply,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          LoginButton(
            textButton: ManagerStrings.guestManagement,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
