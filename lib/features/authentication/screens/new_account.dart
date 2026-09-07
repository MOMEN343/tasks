import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/core/managers/manager_strings.dart';

import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/login_screen.dart';
import 'package:tasks/features/authentication/screens/new_account_verification.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/authentication/widgets/password_field.dart';
import 'package:tasks/features/authentication/widgets/phone_feild.dart';
import 'package:tasks/features/onboarding/managers/manager_font_size.dart'
    show ManagerFontSize;

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccount();
}

class _NewAccount extends State<NewAccount> {
  String phoneNumber = '';

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
                              ManagerStrings.createYourAccount,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: ManagerStyles.bigTitle,
                            ),

                            Text(
                              ManagerStrings.enterYourDataToCreateAccount,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: ManagerStyles.subTitle.copyWith(
                                fontSize: ManagerFontSize.small,
                              ),
                            ),

                            Form(
                              child: Column(
                                spacing: 24,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ManagerStrings.fullName,
                                        style: ManagerStyles.subTitle,
                                      ),

                                      TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 15,
                                          ),
                                          hintText: ManagerStrings.fullNameHint,
                                          hintStyle: TextStyle(
                                            fontFamily:
                                                ManagerFontFamily.almarai,
                                            color: Color(0XFFACB5BB),
                                            fontSize: 16,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFEDF1F3),
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ManagerColors.primary,
                                              style: BorderStyle.solid,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  PhoneField(
                                    onChanged: (phone) {
                                      phoneNumber = phone;
                                    },
                                  ),

                                  Column(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ManagerStrings.setPassword,
                                        style: ManagerStyles.subTitle,
                                      ),
                                      PasswordField(validator: (value) {}),
                                    ],
                                  ),

                                  Column(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ManagerStrings.confirmPassword,
                                        style: ManagerStyles.subTitle,
                                      ),
                                      PasswordField(validator: (value) {}),
                                    ],
                                  ),

                                  LoginButton(
                                    textButton: ManagerStrings.createNewAccount,
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewAccountVerification(
                                                phoneNumber: phoneNumber,
                                              ),
                                        ),
                                      );
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
                            Text(ManagerStrings.alreadyHaveAccount),

                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                ManagerStrings.login,
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
