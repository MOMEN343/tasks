import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/widgets/arrow_button.dart';
import 'package:tasks/widgets/onboarding_indicator.dart';
import 'package:tasks/widgets/skip_button.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
                        image: AssetImage("assets/images/Onboarding1.png"),
                      ),
                    ),

                    OnboardingIndicator(align: AlignmentGeometry.bottomRight),
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          "نظم مناسباتك بسهولة وذكاء",
                          style: TextStyle(
                            fontFamily: "Almarai",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "ارفع صورة دعوتك الجاهزة، أضف تفاصيل المناسبة مثل الاسم والمكان والموعد، ودع التطبيق يتولى إرسالها لجميع المدعوين بطريقة أنيقة ومنظمة.",
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

                ArrowButton(icon: Icons.arrow_back),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
