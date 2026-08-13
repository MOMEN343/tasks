import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final AlignmentGeometry align;
  const OnboardingIndicator({super.key, required this.align});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: align,
      textDirection: TextDirection.rtl,
      children: [
        Container(
          width: double.infinity,
          height: 2,
          color: ManagerColors.lightGrey,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ManagerColors.primary,
          ),
          width: MediaQuery.of(context).size.width * 0.3,
          height: 4,
        ),
      ],
    );
  }
}
