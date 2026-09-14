import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/wallet/managers/wallet_font_size_manager.dart';
import 'package:tasks/features/wallet/managers/wallet_manager_styles.dart';
import 'package:tasks/features/wallet/models/transaction_model.dart';
import 'package:tasks/features/wallet/widgets/ryal_image.dart';
import 'package:intl/intl.dart' as intl;

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  TransactionCard({super.key, required this.transaction});

  final formatter = intl.NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: statusColor().withValues(alpha: 0.1),
          ),
          child: Icon(Icons.check_circle_sharp, color: statusColor()),
        ),
        title: Text(
          transaction.type == TransactionType.gift
              ? transaction.senderName != null
                    ? "${ManagerStrings.giftTransactionTitle} ${transaction.senderName}"
                    : ManagerStrings.governmentGiftTransactionTitle
              : ManagerStrings.transferRequestTransactionTitle,
          style: WalletManagerStyles.blackLabel,
        ),
        subtitle: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction.date, style: WalletManagerStyles.greysmallLabel),
            if (transaction.type != TransactionType.gift)
              Container(
                width: 75,
                height: 16,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: statusColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Icon(
                      transaction.status == TransactionStatus.completed
                          ? Icons.check_circle_outline_sharp
                          : Icons.access_time,
                      size: WalletFontSizeManager.medium,
                      color: statusColor(),
                    ),
                    Text(
                      transaction.status == TransactionStatus.completed
                          ? ManagerStrings.completedTransactionStatus
                          : ManagerStrings.inProgressTransactionStatus,
                      style: TextStyle(
                        fontSize: WalletFontSizeManager.smaller,
                        color: statusColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        trailing: Row(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${transaction.type == TransactionType.gift ? '+' : '-'}${formatter.format(transaction.amount)}",
              style: TextStyle(color: statusColor()),
            ),
            RyalImage(color: statusColor()),
          ],
        ),
      ),
    );
  }

  Color statusColor() {
    if (transaction.type == TransactionType.gift) {
      return ManagerColors.primary;
    } else if (transaction.status == TransactionStatus.completed) {
      return ManagerColors.green;
    } else {
      return ManagerColors.red;
    }
  }
}
