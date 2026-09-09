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
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                              key: formKey,
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'هذا الحقل مطلوب';
                                          }

                                          if (value.length < 3) {
                                            return 'يرجى إدخال الاسم الكامل';
                                          }

                                          if (RegExp(
                                            r'[0-9]',
                                          ).hasMatch(value)) {
                                            return 'الاسم لا يمكن أن يحتوي على أرقام';
                                          }

                                          return null;
                                        },
                                        decoration:
                                            ManagerStyles.textFormFieldDecoration(
                                              hintText: ManagerStrings.fullName,
                                            ),
                                      ),
                                    ],
                                  ),

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
                                  Column(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ManagerStrings.setPassword,
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
                                        controller: passwordController,
                                      ),
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
                                      PasswordField(
                                        hintText:
                                            ManagerStrings.confirmPassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'هذا الحقل مطلوب';
                                          }

                                          if (value !=
                                              passwordController.text) {
                                            return 'كلمتا المرور غير متطابقتين';
                                          }

                                          return null;
                                        },
                                        controller: confirmPasswordController,
                                      ),
                                    ],
                                  ),

                                  LoginButton(
                                    textButton: ManagerStrings.createNewAccount,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewAccountVerification(
                                                  phoneNumber: phoneNumber,
                                                ),
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
