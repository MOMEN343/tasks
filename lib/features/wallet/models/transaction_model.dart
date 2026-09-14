enum TransactionType { gift, transferRequest }

enum TransactionStatus { completed, inProgress }

class TransactionModel {
  final TransactionType type;
  final TransactionStatus status;
  final String date;
  final double amount;
  final String? senderName;

  TransactionModel({
    required this.type,
    required this.status,
    required this.date,
    required this.amount,
    this.senderName,
  });
}
