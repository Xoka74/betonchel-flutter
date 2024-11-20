import 'package:betonchel_manager/di/constants/configuration_keys.dart';
import 'package:betonchel_manager/utils/static_assert.dart';

class EnvironmentConfiguration {
  // Use [StaticAssert] annotation and bool.hasEnvironment(`variable name`)
  // condition to check for the existence of required environment variable at compile time.
  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.baseUrl),
    'Not found environment variable with name - ${ConfigurationKeys.baseUrl}',
  )
  static const baseUrl = String.fromEnvironment(ConfigurationKeys.baseUrl);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.baseWebsocketUrl),
    'Not found environment variable with name - ${ConfigurationKeys.baseWebsocketUrl}',
  )
  static const baseWebsocketUrl = String.fromEnvironment(ConfigurationKeys.baseWebsocketUrl);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.tileMapProvider),
    'Not found environment variable with name - ${ConfigurationKeys.tileMapProvider}',
  )
  static const tileMapProvider = String.fromEnvironment(ConfigurationKeys.tileMapProvider);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.apiKey),
    'Not found environment variable with name - ${ConfigurationKeys.apiKey}',
  )
  static const apiKey = String.fromEnvironment(ConfigurationKeys.apiKey);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.defaultLocationLatitude),
    'Not found environment variable with name - ${ConfigurationKeys.defaultLocationLatitude}',
  )
  static const defaultLocationLatitude = String.fromEnvironment(ConfigurationKeys.defaultLocationLatitude);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.defaultLocationLongitude),
    'Not found environment variable with name - ${ConfigurationKeys.defaultLocationLongitude}',
  )
  static const defaultLocationLongitude = String.fromEnvironment(ConfigurationKeys.defaultLocationLongitude);
}
