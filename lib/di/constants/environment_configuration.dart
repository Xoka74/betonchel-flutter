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
    bool.hasEnvironment(ConfigurationKeys.secret),
    'Not found environment variable with name - ${ConfigurationKeys.secret}',
  )
  static const secret = String.fromEnvironment(ConfigurationKeys.secret);
}
