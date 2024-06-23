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
    bool.hasEnvironment(ConfigurationKeys.baseAuthUrl),
    'Not found environment variable with name - ${ConfigurationKeys.baseAuthUrl}',
  )
  static const baseAuthUrl = String.fromEnvironment(ConfigurationKeys.baseAuthUrl);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.baseNotificationsUrl),
    'Not found environment variable with name - ${ConfigurationKeys.baseNotificationsUrl}',
  )
  static const baseNotificationsUrl = String.fromEnvironment(ConfigurationKeys.baseNotificationsUrl);
}
