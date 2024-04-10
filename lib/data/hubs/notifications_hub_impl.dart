import 'package:betonchel_manager/domain/hubs/notifications_hub.dart';
import 'package:betonchel_manager/domain/models/notification/notification.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationsHub)
class NotificationsHubImpl implements NotificationsHub {
  @override
  Stream<Notification> get notifications => throw UnimplementedError();
}
