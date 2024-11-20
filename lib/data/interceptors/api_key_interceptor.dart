import 'package:betonchel_manager/data/constants/request_keys.dart';
import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';

@injectable
class ApiKeyInterceptor extends Interceptor {
  final String _apiKey;

  ApiKeyInterceptor(@Named(InjectionKeys.apiKey) this._apiKey);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.putIfAbsent(
      HeaderKeys.apiKey,
      () => _apiKey,
    );

    return handler.next(options);
  }
}
