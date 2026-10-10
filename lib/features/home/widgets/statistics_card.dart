import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/home/managers/manager_font_size.dart';

class StatisticsCard extends StatelessWidget {
  final Widget icon;
  final String value;
  final String label;
  const StatisticsCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 106,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: Offset(0, 2),
              spreadRadius: 0,
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              value.toString(),
              style: TextStyle(fontSize: ManagerFontSize.larg),
            ),
            Text(
              label,
              style: TextStyle(color: ManagerColors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
