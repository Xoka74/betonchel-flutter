import 'dart:async';

import 'package:betonchel_manager/data/models/enums/device_type.dart';

abstract class PushNotificationsRepository {
  Future<void> registerDevice(String token);

  FutureOr<DeviceType> get deviceType;

  FutureOr<String?> get deviceName;
}
