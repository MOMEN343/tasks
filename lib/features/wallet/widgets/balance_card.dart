import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/wallet/data/balance.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_styles.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';

class BalanceCard extends StatelessWidget {
  final formatter = intl.NumberFormat('#,###');

  BalanceCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ManagerStrings.balance,
                          style: WalletManagerStyles.greyLabel,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              formatter.format(wallet.availableBalance),
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RyalImage(size: 20),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(9),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: ManagerColors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/solar_card-broken.svg",
                    ),
                  ),
                ),
              ],
            ),

            Divider(color: ManagerColors.blue.withValues(alpha: 0.3)),

            Column(
              spacing: 5,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ManagerStrings.pendingBalance,
                      style: WalletManagerStyles.greyLabel,
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          formatter.format(wallet.pendingBalance),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        RyalImage(size: 12),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ManagerStrings.withdrawableBalance,
                      style: WalletManagerStyles.greyLabel,
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          formatter.format(wallet.withdrawableBalance),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        RyalImage(size: 12),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
