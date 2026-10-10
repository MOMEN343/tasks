import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/core/widgets/login_button.dart';
import 'package:tasks/features/wallet/data/transaction.dart';

import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tasks/features/wallet/screens/new_withdrawal_screen.dart';
import 'package:tasks/features/wallet/widgets/balance_card.dart';
import 'package:tasks/features/wallet/widgets/top_part.dart';
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
              TopPart(
                title: ManagerStrings.walletScreenTitle,
                subTitle: ManagerStrings.walletScreenSubTitle,
                height: 118,
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewWithdrawalScreen(),
                            ),
                          );
                        },
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
