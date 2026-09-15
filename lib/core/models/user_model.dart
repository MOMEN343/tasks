class UserModel {
  final String name;
  final String image;
  final String? bankAccount;
  final String? bankName;

  UserModel({
    required this.name,
    required this.image,
    this.bankAccount,
    this.bankName,
  });
}
