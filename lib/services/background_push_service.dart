import 'package:betonchel_manager/domain/repositories/push_notifications_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@injectable
class BackgroundPushService {
  final PushNotificationsRepository _notificationsRepository;

  BackgroundPushService(this._notificationsRepository) {
    _init();
  }

  Future<void> _init() async {
    final token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      await _notificationsRepository.registerDevice(token);
    }

    FirebaseMessaging.instance.onTokenRefresh.listen(
      _notificationsRepository.registerDevice,
    );
  }
}
