import 'package:betonchel_manager/data/constants/request_keys.dart';
import 'package:betonchel_manager/data/interceptors/auth_token_interceptor.dart';
import 'package:betonchel_manager/data/interceptors/logging_interceptor.dart';
import 'package:betonchel_manager/di/constants/environment_configuration.dart';
import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named(InjectionKeys.baseUrl)
  String get baseUrl => EnvironmentConfiguration.baseUrl;

  @Named(InjectionKeys.secret)
  String get secret => EnvironmentConfiguration.secret;

  Dio dio(
    @Named(InjectionKeys.baseUrl) String baseUrl,
    @Named(InjectionKeys.secret) String secret,
    AuthTokenInterceptor authTokenInterceptor,
    LoggingInterceptor loggingInterceptor,
  ) =>
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            RequestKeys.apiKey: secret,
          },
        ),
      )..interceptors.addAll(
          [
            authTokenInterceptor,
            loggingInterceptor,
          ],
        );
}
