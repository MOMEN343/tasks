import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/core/managers/manager_styles.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/features/authentication/screens/reset_password.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/authentication/widgets/phone_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Padding(
              padding: const EdgeInsets.only(top: 73),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تسجيل الدخول إلى حسابك",
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: ManagerStyles.bigTitle,
                        ),
                        Text(
                          "أدخل رقم الهاتف و كلمة المرور لتسجيل الدخول",
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: ManagerStyles.subTitle,
                        ),
                        Form(
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Phonefeild(),

                              Text(
                                "كلمة المرور",
                                style: ManagerStyles.subTitle,
                              ),
                              TextFormField(
                                obscureText: obscurePassword,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 15,
                                  ),

                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                    icon: FaIcon(
                                      obscurePassword
                                          ? FontAwesomeIcons.eyeSlash
                                          : FontAwesomeIcons.eye,
                                    ),
                                    iconSize: 15,
                                  ),
                                  hintText: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                    fontFamily: ManagerFontFamily.almarai,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEDF1F3),
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ManagerColors.primary,
                                      style: BorderStyle.solid,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              TextButton(
                                child: Text(
                                  " هل نسيت كلمة السر؟",
                                  style: ManagerStyles.secondaryText.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: ManagerColors.secondary,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ResetPassword(),
                                    ),
                                  );
                                },
                              ),
                              LoginButton(textButton: "تسجيل الدخول"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ليس لديك حساب؟"),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "إنشاء حساب جديد",
                            style: ManagerStyles.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
