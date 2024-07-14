import 'package:betonchel_manager/data/constants/request_keys.dart';
import 'package:betonchel_manager/data/constants/storage_keys.dart';
import 'package:betonchel_manager/utils/extensions/string_extensions.dart';
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

    if (accessToken == null) {
      return handler.next(options);
    }

    options.headers.putIfAbsent(
      RequestKeys.authorization,
      () => accessToken.bearer,
    );

    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }



  }
}
