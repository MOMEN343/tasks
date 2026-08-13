import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/core/managers/manager_images.dart';
import 'package:tasks/core/managers/manager_styles.dart';
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
                      child: SvgPicture.asset(
                        ManagerImages.onboarding3,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),

                    OnboardingIndicator(align: AlignmentGeometry.centerLeft),
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          "استقبل الإهداءات الرقمية بكل راحة وأمان",
                          style: ManagerStyles.bold,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "دع ضيوفك يشاركون فرحتك بإرسال الهدايا المالية مباشرة عبر التطبيق، وكل المبالغ تُجمع في محفظة آمنة مع سجل ذكي يذكّرك بمن أهدى لك سابقاً لتبادل الودّ في مناسبات المستقبل.",
                          style: ManagerStyles.regular,
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
                          backgroundColor: ManagerColors.primary,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),

                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            44,
                          ),
                          // padding: EdgeInsets.all(14),
                        ),

                        onPressed: () {},
                        child: Text("التسجيل الآن", style: ManagerStyles.title),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                            color: ManagerColors.grey,
                            decoration: TextDecoration.underline,
                            decorationColor: ManagerColors.grey,
                            fontFamily: ManagerFontFamily.almarai,
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
