import 'package:intl/intl.dart';

class ManagerDate {
  static String formatDate(DateTime date) {
    return DateFormat('d MMMM y', 'ar').format(date);
  }

  static String eventCardFormatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
