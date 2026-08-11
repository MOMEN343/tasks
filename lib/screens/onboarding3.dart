import 'package:flutter/material.dart';
import 'package:tasks/constants/app_color.dart';
import 'package:tasks/widgets/onboarding_indicator.dart';
import 'package:tasks/widgets/skip_button.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                        image: AssetImage("assets/images/Onboarding3.png"),
                      ),
                    ),

                    OnboardingIndicator(align: AlignmentGeometry.centerLeft),
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          "استقبل الإهداءات الرقمية بكل راحة وأمان",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "Almarai",
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "دع ضيوفك يشاركون فرحتك بإرسال الهدايا المالية مباشرة عبر التطبيق، وكل المبالغ تُجمع في محفظة آمنة مع سجل ذكي يذكّرك بمن أهدى لك سابقاً لتبادل الودّ في مناسبات المستقبل.",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
                            fontFamily: "Almarai",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),

                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            0,
                          ),
                          padding: EdgeInsets.all(14),
                        ),

                        onPressed: () {},
                        child: Text(
                          "التسجيل الآن",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Almarai",
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                            color: AppColors.grey,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.grey,
                            fontFamily: "Almarai",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
