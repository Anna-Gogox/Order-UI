import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderStatusHelper {
  String getStatusText(BuildContext context, int statusCd) {
    final localizations = AppLocalizations.of(context)!;
    switch (statusCd) {
      case 1:
        return localizations.ordersStatusPending;
      case 2:
        return localizations.ordersStatusActive;
      case 3:
        return localizations.ordersStatusCompleted;
      case 4:
        return localizations.ordersStatusIncomplete;
      case 5:
        return localizations.ordersStatusCancelled;
      case 6:
        return localizations.ordersStatusReturned;
      case 7:
        return localizations.orderStatusWaitingForPayment;
      default:
        return localizations.ordersStatusPending;
    }
  }
}
