import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/core/theme/app_theme.dart';
import 'package:order_ui/utils/order_status_helper.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({super.key, required this.status});
  final int? status;

  @override
  Widget build(BuildContext context) {
    final orderStatusHelper = Modular.get<OrderStatusHelper>();
    final List<Color> colors = colorStatus(context, status);

    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 7, right: 7),
      decoration: BoxDecoration(
        color: colors[1],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        orderStatusHelper.getStatusText(context, status),
        style: context.appTheme.caption.copyWith(color: colors[0]),
      ),
    );
  }
}

// List colors for text - background status
List<Color> colorStatus(BuildContext context, int? status) {
  final customTheme = context.appTheme;

  switch (status) {
    case 1:
      return [Colors.black, customTheme.palette.neutral4];
    case 2:
      return [Colors.white, customTheme.palette.status2];
    case 3:
      return [customTheme.palette.primaryDark, customTheme.palette.primaryLight];
    case 4:
      return [Colors.white, customTheme.palette.primary];
    case 5:
      return [Colors.black, customTheme.palette.neutral4];
    case 6:
      return [Colors.black, customTheme.palette.neutral4];
    case 7:
      return [Colors.black, customTheme.palette.neutral4];
    default:
      return [Colors.black, customTheme.palette.neutral4];
  }
}