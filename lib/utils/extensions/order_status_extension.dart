import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension OrderStatusExtension on OrderStatus {
  String title(AppLocalizations strings) => switch (this) {
        OrderStatus.created => strings.created,
        OrderStatus.inProcess => strings.inWork,
        OrderStatus.successfullyFinished => strings.finished,
        OrderStatus.rejected => strings.cancelled,
      };
}

