import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/home/managers/manager_font_size.dart';

class CountBar extends StatelessWidget {
  final int count;
  final Color color;
  final String countNumber;
  final String label;
  const CountBar({
    super.key,
    required this.count,
    required this.color,
    required this.countNumber,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: ManagerFontSize.smaller)),
            Text(countNumber, style: TextStyle(fontSize: 8, color: color)),
          ],
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ManagerColors.lightGrey.withValues(alpha: 0.5),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) * (count / 250),
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
