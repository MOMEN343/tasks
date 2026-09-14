import 'package:tasks/features/wallet/models/transaction_model.dart';

final List<TransactionModel> transactions = [
  TransactionModel(
    type: TransactionType.gift,
    status: TransactionStatus.completed,
    date: "29 جمادى الأولى 1447 ه",
    amount: 15000,
  ),
  TransactionModel(
    type: TransactionType.transferRequest,
    status: TransactionStatus.inProgress,
    date: "28 جمادى الأولى 1447 ه",
    amount: 9000,
  ),
  TransactionModel(
    type: TransactionType.gift,
    status: TransactionStatus.completed,
    date: "28 جمادى الأولى 1447 ه",
    amount: 9000,
    senderName: "محمد أبو موسى",
  ),
  TransactionModel(
    type: TransactionType.transferRequest,
    status: TransactionStatus.completed,
    date: "28 جمادى الأولى 1447 ه",
    amount: 9000,
  ),
];
