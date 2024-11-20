import 'package:betonchel_manager/data/interceptors/api_key_interceptor.dart';
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

  @Named(InjectionKeys.baseWebsocketUrl)
  String get baseNotificationsUrl => EnvironmentConfiguration.baseWebsocketUrl;

  @Named(InjectionKeys.apiKey)
  String get apiKey => EnvironmentConfiguration.apiKey;

  Dio dio(
    @Named(InjectionKeys.baseUrl) String baseUrl,
    AuthTokenInterceptor authTokenInterceptor,
    ApiKeyInterceptor apiKeyInterceptor,
    LoggingInterceptor loggingInterceptor,
  ) =>
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      )..interceptors.addAll(
          [
            authTokenInterceptor,
            apiKeyInterceptor,
            loggingInterceptor,
          ],
        );
}
