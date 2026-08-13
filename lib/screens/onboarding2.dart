import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/screens/onboarding1.dart';
import 'package:tasks/widgets/arrow_button.dart';
import 'package:tasks/widgets/onboarding_indicator.dart';
import 'package:tasks/widgets/skip_button.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
                      child: Image(
                        image: AssetImage("assets/images/Onboarding2.png"),
                      ),
                    ),

                    OnboardingIndicator(align: AlignmentGeometry.center),
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          "تابع المدعوين وتفاعلهم بكل سهولة",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Almarai",
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "اعرف من أكّد الحضور أو اعتذر فوراً، وراقب الإحصائيات لحظة بلحظة لتكون على اطلاع دائم بعدد الحاضرين، وتدير مناسبتك بدون فوضى أو تكرار.",
                          style: TextStyle(
                            color: ManagerColors.grey,
                            fontSize: 12,
                            fontFamily: "Almarai",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowButton(icon: Icons.arrow_back),

                    ArrowButton(icon: Icons.arrow_forward),
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
