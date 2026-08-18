import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/managers/manager_images.dart';
import 'package:tasks/core/managers/manager_styles.dart';
import 'package:tasks/features/onboarding/widgets/arrow_button.dart';
import 'package:tasks/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:tasks/features/onboarding/widgets/skip_button.dart';

class Onboarding2 extends StatelessWidget {
  final PageController controller;
  const Onboarding2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkipButton(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        ManagerImages.onboarding2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),

                    OnboardingIndicator(align: AlignmentGeometry.center),
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          "تابع المدعوين وتفاعلهم بكل سهولة",
                          style: ManagerStyles.bold,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "اعرف من أكّد الحضور أو اعتذر فوراً، وراقب الإحصائيات لحظة بلحظة لتكون على اطلاع دائم بعدد الحاضرين، وتدير مناسبتك بدون فوضى أو تكرار.",
                          style: ManagerStyles.subTitle,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowButton(
                      icon: Icons.arrow_back,
                      onPressed: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),

                    ArrowButton(
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
