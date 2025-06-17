// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String title_app_bar(String title) {
    return '주문 목록';
  }

  @override
  String get ordersStatusPending => 'Searching';

  @override
  String get ordersStatusActive => 'Active';

  @override
  String get ordersStatusCompleted => 'Completed';

  @override
  String get ordersStatusIncomplete => 'Incomplete';

  @override
  String get ordersStatusCancelled => 'Cancelled';

  @override
  String get ordersStatusReturned => 'Returned';

  @override
  String get orderStatusWaitingForPayment => 'Waiting for payment';

  @override
  String get something_went_wrong => 'Something went wrong';
}
