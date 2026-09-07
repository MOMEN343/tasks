import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/onboarding/managers/manager_images.dart';
import 'package:tasks/features/onboarding/managers/manager_styles.dart';
import 'package:tasks/features/onboarding/widgets/arrow_button.dart';
import 'package:tasks/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:tasks/features/onboarding/widgets/skip_button.dart';

class Onboarding1 extends StatelessWidget {
  final PageController controller;

  const Onboarding1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkipButton(controller: controller),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        ManagerImages.onboarding1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),

                    OnboardingIndicator(align: AlignmentGeometry.bottomRight),

                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          ManagerStrings.onboardingTitle1,
                          style: ManagerStyles.title,
                        ),
                        Text(
                          ManagerStrings.onboardingDescription1,
                          textAlign: TextAlign.center,
                          style: ManagerStyles.subTitle,
                        ),
                      ],
                    ),
                  ],
                ),

                ArrowButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
