import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/authentication/managers/manager_styles.dart';
import 'package:tasks/features/authentication/screens/login_screen.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';

class AccountCreatedSuccessfully extends StatelessWidget {
  const AccountCreatedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            child: Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  spacing: 41,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(
                          'assets/images/account_created_successfully.svg',
                        ),

                        Text(
                          ManagerStrings.accountCreatedSuccessfully,
                          style: ManagerStyles.regularText.copyWith(
                            color: ManagerColors.primary,
                          ),
                        ),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ManagerStrings.welcomeToMunasaba,
                                style: ManagerStyles.subTitle.copyWith(
                                  color: ManagerColors.secondary,
                                ),
                              ),
                              TextSpan(
                                text: ManagerStrings.accountCreatedDescription,
                                style: ManagerStyles.subTitle.copyWith(
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        LoginButton(
                          textButton: ManagerStrings.login,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        ),

                        TextButton(
                          onPressed: () {},
                          child: Text(
                            ManagerStrings.usageAndPrivacyPolicies,
                            style: ManagerStyles.subTitle.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                              decorationColor: ManagerColors.grey,
                              decorationThickness: 0.5,
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
    );
  }
}
