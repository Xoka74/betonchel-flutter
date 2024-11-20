import 'package:betonchel_manager/di/constants/environment_configuration.dart';
import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@module
abstract class MapsConfigModule {
  @Named(InjectionKeys.defaultLocation)
  LatLng get defaultLocationLatitude => LatLng(
        double.parse(EnvironmentConfiguration.defaultLocationLatitude),
        double.parse(EnvironmentConfiguration.defaultLocationLongitude),
      );

  @Named(InjectionKeys.tileMapProvider)
  String get tileMapProvider => EnvironmentConfiguration.tileMapProvider;
}
