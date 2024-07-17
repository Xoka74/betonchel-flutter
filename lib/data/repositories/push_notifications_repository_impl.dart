import 'dart:io';

import 'package:betonchel_manager/data/api/fcm_push_api.dart';
import 'package:betonchel_manager/data/models/enums/device_type.dart';
import 'package:betonchel_manager/data/models/requests/register_device_request.dart';
import 'package:betonchel_manager/data/repositories/base_repository.dart';
import 'package:betonchel_manager/data/token/token_verifier.dart';
import 'package:betonchel_manager/domain/repositories/push_notifications_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PushNotificationsRepository)
class PushNotificationsRepositoryImpl extends BaseRepository implements PushNotificationsRepository {
  final FcmPushApi _pushApi;
  final DeviceInfoPlugin _deviceInfo;

  PushNotificationsRepositoryImpl(
    this._pushApi,
    this._deviceInfo,
    TokenVerifier tokenVerifier,
  ) : super(tokenVerifier);

  @override
  Future<void> registerDevice(String token) async => withTokenVerification(
        () async {
          final request = RegisterDeviceRequest(
            registrationId: token,
            type: deviceType,
            name: await deviceName,
          );

          await _pushApi.registerDevice(request);
        },
      );

  @override
  DeviceType get deviceType {
    if (kIsWeb) {
      return DeviceType.web;
    }

    if (Platform.isIOS) {
      return DeviceType.ios;
    } else {
      return DeviceType.android;
    }
  }

  @override
  Future<String?> get deviceName async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;

      return androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;

      return iosInfo.model;
    } else {
      final iosInfo = await _deviceInfo.webBrowserInfo;

      return iosInfo.userAgent;
    }
  }
}
