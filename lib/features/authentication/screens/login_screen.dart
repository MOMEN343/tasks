import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/new_account.dart';
import 'package:tasks/features/authentication/screens/reset_password.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/authentication/widgets/password_field.dart';
import 'package:tasks/features/authentication/widgets/phone_feild.dart';
import 'package:tasks/features/onboarding/managers/manager_font_size.dart'
    show ManagerFontSize;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String phoneNumber = '';
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset("assets/images/back.svg"),
                ),
              ),
              Padding(
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
                              style: ManagerStyles.subTitle.copyWith(
                                fontSize: ManagerFontSize.small,
                              ),
                            ),
                            Form(
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PhoneField(
                                    onChanged: (phone) {
                                      phoneNumber = phone;
                                    },
                                  ),

                                  Text(
                                    "كلمة المرور",
                                    style: ManagerStyles.subTitle,
                                  ),
                                  PasswordField(validator: (value) {}),

                                  TextButton(
                                    child: Text(
                                      " هل نسيت كلمة السر؟",
                                      style: ManagerStyles.subTitle.copyWith(
                                        color: ManagerColors.secondary,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            ManagerColors.secondary,
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
                                  LoginButton(
                                    textButton: "تسجيل الدخول",
                                    onPressed: () {},
                                  ),
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
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => NewAccount(),
                                  ),
                                );
                              },
                              child: Text(
                                "إنشاء حساب جديد",
                                style: ManagerStyles.subTitle.copyWith(
                                  color: ManagerColors.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
