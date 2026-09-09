import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';

import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/new_account.dart';
import 'package:tasks/features/authentication/screens/reset_password.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/authentication/widgets/password_field.dart';
import 'package:tasks/features/authentication/widgets/phone_feild.dart';

import 'package:tasks/features/home/screens/home_screen.dart';
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
  GlobalKey<FormState> formkey = GlobalKey();
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              ManagerStrings.loginToYourAccount,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: ManagerStyles.bigTitle,
                            ),

                            Text(
                              ManagerStrings.enterPhoneAndPassword,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: ManagerStyles.subTitle.copyWith(
                                fontSize: ManagerFontSize.small,
                              ),
                            ),

                            Form(
                              key: formkey,
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PhoneField(
                                    validator: (phone) {
                                      if (phone == null ||
                                          phone.number.trim().isEmpty) {
                                        return ManagerStrings.requiredField;
                                      }

                                      if (phone.number.length < 9) {
                                        return ManagerStrings
                                            .invalidPhoneNumber;
                                      }

                                      if (phone.number.length > 10) {
                                        return ManagerStrings
                                            .phoneNumberMaxLength;
                                      }

                                      return null;
                                    },
                                    onChanged: (phone) {
                                      phoneNumber = phone;
                                    },
                                  ),

                                  Text(
                                    ManagerStrings.password,
                                    style: ManagerStyles.subTitle,
                                  ),

                                  PasswordField(
                                    hintText: ManagerStrings.password,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'هذا الحقل مطلوب';
                                      }

                                      if (value.length < 6) {
                                        return 'يجب أن تكون 6 أحرف أو أكثر';
                                      }

                                      return null;
                                    },
                                    controller: TextEditingController(),
                                  ),

                                  TextButton(
                                    child: Text(
                                      ManagerStrings.forgotPassword,
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
                                    textButton: ManagerStrings.login,
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(ManagerStrings.noAccount),

                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => NewAccount(),
                                  ),
                                );
                              },
                              child: Text(
                                ManagerStrings.createNewAccount,
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
