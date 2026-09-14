import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasks/core/managers/manager_colors.dart';

import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/wallet/data/balance.dart';
import 'package:tasks/features/wallet/data/transaction.dart';

import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_image.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tasks/features/wallet/managers/wallet_manager_styles.dart';
import 'package:tasks/features/wallet/widgets/balance_card.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';
import 'package:tasks/features/wallet/widgets/transaction_card.dart';

class WalletScreen extends StatelessWidget {
  final formatter = intl.NumberFormat('#,###');

  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 118,
                color: ManagerColors.primary,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        spacing: 5,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                          Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ManagerStrings.walletScreenTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: WalletFontSizeManager.larger,
                                ),
                              ),
                              Text(
                                ManagerStrings.walletScreenSubTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: WalletFontSizeManager.small,
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

              Transform.translate(
                offset: const Offset(0, -38),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      BalanceCard(),
                      LoginButton(
                        textButton: "طلب سحب أرباح",
                        onPressed: () {},
                      ),

                      Text(
                        "سجل العمليات",
                        style: TextStyle(
                          fontSize: WalletFontSizeManager.larg,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionCard(
                            transaction: transactions[index],
                          );
                        },
                      ),
                    ],
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
