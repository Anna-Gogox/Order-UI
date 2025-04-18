import 'package:intl/intl.dart';

final NumberFormat wonFormat = NumberFormat.currency(
  locale: 'ko_KR',
  symbol: '₩',
  decimalDigits: 2,
);

String formatWon(num amount) => wonFormat.format(amount);
