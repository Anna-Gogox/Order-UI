import 'package:intl/intl.dart';

final NumberFormat wonFormat = NumberFormat.currency(
  locale: 'ko_KR',
  symbol: '₩',
);

String formatWon(num amount) => wonFormat.format(amount);
