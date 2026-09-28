import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/core/widgets/login_button.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/screens/gifts_log_screen.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';

class GiftsView extends StatelessWidget {
  final double totalGiftAmount;
  final int giftsCount;
  final double averageGiftValue;

  const GiftsView({
    super.key,
    required this.totalGiftAmount,
    required this.giftsCount,
    required this.averageGiftValue,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat('#,###');

    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Column(
            spacing: 10,
            children: [
              Container(
                width: double.infinity,
                height: 42,
                padding: EdgeInsets.symmetric(horizontal: 13),
                color: ManagerColors.blue.withValues(alpha: 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ManagerStrings.totalGiftAmount,
                      style: ManagerTextStyles.label.copyWith(
                        color: ManagerColors.primary,
                      ),
                    ),
                    Row(
                      spacing: 3,
                      children: [
                        Text(
                          formatter.format(totalGiftAmount),
                          style: TextStyle(color: ManagerColors.primary),
                        ),
                        RyalImage(color: ManagerColors.primary),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 42,
                padding: EdgeInsets.symmetric(horizontal: 13),
                color: ManagerColors.blue.withValues(alpha: 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ManagerStrings.numberOfGiftGivers,
                      style: ManagerTextStyles.label.copyWith(
                        color: ManagerColors.primary,
                      ),
                    ),
                    Row(
                      spacing: 3,
                      children: [
                        Text(
                          formatter.format(giftsCount),
                          style: TextStyle(color: ManagerColors.primary),
                        ),
                        Text(
                          ManagerStrings.person,
                          style: ManagerTextStyles.label.copyWith(
                            color: ManagerColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 42,
                padding: EdgeInsets.symmetric(horizontal: 13),
                color: ManagerColors.blue.withValues(alpha: 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ManagerStrings.averageGiftValue,
                      style: ManagerTextStyles.label.copyWith(
                        color: ManagerColors.primary,
                      ),
                    ),
                    Row(
                      spacing: 3,
                      children: [
                        Text(
                          formatter.format(averageGiftValue),
                          style: TextStyle(color: ManagerColors.primary),
                        ),
                        RyalImage(color: ManagerColors.primary),
                      ],
                    ),
                  ],
                ),
              ),
              LoginButton(
                textButton: ManagerStrings.viewGiftsLog,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GiftsLogScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
