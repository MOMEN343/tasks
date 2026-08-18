import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_font_size.dart';
import 'package:tasks/core/managers/manager_styles.dart';
import 'package:tasks/features/authentication/widgets/Login_button.dart';
import 'package:tasks/features/authentication/widgets/phone_feild.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Padding(
                padding: const EdgeInsets.only(top: 72),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 67,
                    children: [
                      Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "إعادة تعيين كلمة المرور",
                            style: ManagerStyles.title,
                          ),
                          Text(
                            "يرجى إدخال رقم هاتفك المرتبط بحسابك. سنرسل لك تعليمات حول كيفية إنشاء كلمة مرور جديدة عبر رسالة نصية",
                            style: ManagerStyles.subTitle.copyWith(
                              fontSize: ManagerFontSize.medium,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        spacing: 10,
                        children: [
                          Phonefeild(),
                          LoginButton(textButton: "إعادة الضبط"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
