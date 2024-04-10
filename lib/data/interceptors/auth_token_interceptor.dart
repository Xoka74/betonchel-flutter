import 'package:betonchel_manager/data/constants/request_keys.dart';
import 'package:betonchel_manager/data/constants/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthTokenInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;

  AuthTokenInterceptor(this._storage);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _storage.read(key: StorageKeys.accessToken);

    options.headers.putIfAbsent(
      RequestKeys.authorization,
      () => accessToken,
    );

    return handler.next(options);
  }
}
