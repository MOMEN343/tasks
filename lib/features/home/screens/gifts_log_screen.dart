import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/core/widgets/login_button.dart';
import 'package:tasks/features/home/data/gift_transactions.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/widgets/gift_transaction_card.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';
import 'package:tasks/features/wallet/widgets/top_part.dart';

class GiftsLogScreen extends StatelessWidget {
  final formatter = intl.NumberFormat('#,###');

  GiftsLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopPart(
                title: ManagerStrings.giftsLogTitle,
                subTitle: ManagerStrings.giftsLogSubTitle,
                height: 118,
              ),

              Transform.translate(
                offset: Offset(0, -38),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Container(
                        height: 126,
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      ManagerStrings.totalGiftsBalance,
                                      style: ManagerTextStyles.hintText,
                                    ),
                                    Row(
                                      spacing: 7,
                                      children: [
                                        Text(
                                          formatter.format(5200),
                                          style: const TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        RyalImage(
                                          color: ManagerColors.secondary,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: ManagerColors.secondary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            LoginButton(
                              textButton: "سحب الإهداءات",
                              onPressed: () {
                                // نفس منطق سحب الأرباح تقريبا
                              },
                              height: 29,
                            ),
                          ],
                        ),
                      ),

                      Text(
                        "سجل العمليات",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: giftTransactions.length,
                        itemBuilder: (context, index) {
                          return GiftTransactionCard(
                            giftTransaction: giftTransactions[index],
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
