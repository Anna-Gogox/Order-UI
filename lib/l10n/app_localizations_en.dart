// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String title_app_bar(String title) {
    return '$title';
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
