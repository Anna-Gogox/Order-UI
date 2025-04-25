import 'package:intl/intl.dart';

class DateTimeFormatter {
  // Format: dd//MM/yyyy HH:mm
  static String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      final localDateTime = dateTime.toLocal();
      return DateFormat('dd/MM/yyyy HH:mm').format(localDateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }
}