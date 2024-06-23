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

  @Named(InjectionKeys.baseAuthUrl)
  String get baseAuthUrl => EnvironmentConfiguration.baseAuthUrl;

  @Named(InjectionKeys.baseNotificationsUrl)
  String get baseNotificationsUrl => EnvironmentConfiguration.baseNotificationsUrl;

  @Named(InjectionKeys.appDio)
  Dio appDio(
    @Named(InjectionKeys.baseUrl) String baseUrl,
    AuthTokenInterceptor authTokenInterceptor,
    LoggingInterceptor loggingInterceptor,
  ) =>
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      )..interceptors.addAll(
          [
            authTokenInterceptor,
            loggingInterceptor,
          ],
        );

  @Named(InjectionKeys.authDio)
  Dio authDio(
      @Named(InjectionKeys.baseAuthUrl) String baseUrl,
      LoggingInterceptor loggingInterceptor,
      ) =>
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      )..interceptors.addAll(
        [
          loggingInterceptor,
        ],
      );
}
