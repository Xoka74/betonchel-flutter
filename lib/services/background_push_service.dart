import 'dart:async';

import 'package:betonchel_manager/domain/repositories/push_notifications_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@injectable
class BackgroundPushService {
  late final StreamSubscription _subscription;
  final PushNotificationsRepository _notificationsRepository;

  BackgroundPushService(this._notificationsRepository) {
    _init();
  }

  Future<void> _init() async {
    final _ = await FirebaseMessaging.instance.getAPNSToken();
    final token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      await _notificationsRepository.registerDevice(token);
    }

    _subscription = FirebaseMessaging.instance.onTokenRefresh.listen(
      _notificationsRepository.registerDevice,
    );
  }

  Future<void> dispose() => _subscription.cancel();
}
