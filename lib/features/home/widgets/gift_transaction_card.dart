import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/models/gift_transaction.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';

class GiftTransactionCard extends StatelessWidget {
  final GiftTransaction giftTransaction;

  const GiftTransactionCard({super.key, required this.giftTransaction});

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat('#,###');
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ManagerColors.primary.withValues(alpha: 0.1),
          ),
          child: Icon(Icons.check_circle_sharp, color: ManagerColors.primary),
        ),
        title: Text(giftTransaction.title, style: ManagerTextStyles.label),
        subtitle: Text(
          giftTransaction.subTitle,
          style: ManagerTextStyles.subCardTitle,
        ),
        trailing: SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "+ ${formatter.format(giftTransaction.amount)}",
                    style: TextStyle(color: ManagerColors.primary),
                  ),
                  RyalImage(color: ManagerColors.primary),
                ],
              ),

              Text(giftTransaction.date, style: ManagerTextStyles.subCardTitle),
            ],
          ),
        ),
      ),
    );
  }
}
