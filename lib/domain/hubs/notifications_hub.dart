import 'package:betonchel_manager/domain/models/notification/notification.dart';

abstract interface class NotificationsHub {
  Stream<AppNotification> get notifications;
}
