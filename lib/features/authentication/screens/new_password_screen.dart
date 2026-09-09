import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_strings.dart';

import 'package:tasks/features/authentication/managers/manager_font_size.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/password_changed_successfully.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/authentication/widgets/password_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreen();
}

class _NewPasswordScreen extends State<NewPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  padding: const EdgeInsets.only(top: 170),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 70,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ManagerStrings.enterNewPassword,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: ManagerStyles.title,
                                ),

                                Text(
                                  ManagerStrings.completeFinalData,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: ManagerStyles.subTitle,
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    spacing: 52,
                                    children: [
                                      Column(
                                        spacing: 5,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ManagerStrings.password,
                                            style: ManagerStyles.subTitle,
                                          ),

                                          PasswordField(
                                            hintText: ManagerStrings.password,
                                            controller: TextEditingController(),
                                            validator: (value) {
                                              if (value!.length < 6) {
                                                return ManagerStrings
                                                    .passwordTooShort;
                                              }
                                            },
                                          ),

                                          Row(
                                            spacing: 5,
                                            children: [
                                              Icon(
                                                Icons.info_outline,
                                                color: Colors.black,
                                                size: 20,
                                              ),

                                              Text(
                                                ManagerStrings
                                                    .passwordRequirement,
                                                style: ManagerStyles.subTitle
                                                    .copyWith(
                                                      fontSize:
                                                          ManagerFontSize.small,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      Column(
                                        spacing: 5,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ManagerStrings.confirmNewPassword,
                                            style: ManagerStyles.subTitle,
                                          ),

                                          PasswordField(
                                            hintText:
                                                ManagerStrings.confirmPassword,
                                            validator: (value) {},
                                            controller: TextEditingController(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        LoginButton(
                          textButton: ManagerStrings.saveUpdate,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PasswordChangedSuccessfully(),
                                ),
                              );
                            }
                          },
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
