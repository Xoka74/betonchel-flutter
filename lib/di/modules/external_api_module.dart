import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ExternalApiModule {
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();
}
