import 'package:betonchel_manager/domain/models/notification/notification.dart';

class NotificationsState {
  final List<AppNotification> notifications;
  final int unreadCount;

  NotificationsState(this.notifications, this.unreadCount);
}
