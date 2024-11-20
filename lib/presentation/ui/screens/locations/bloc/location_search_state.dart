import 'package:betonchel_manager/domain/models/location/location.dart';

sealed class LocationSearchState {}

class LocationSearchSuccessState extends LocationSearchState {
  final List<Location> locations;

  LocationSearchSuccessState(this.locations);
}

class LocationSearchLoadingState extends LocationSearchState {}

class LocationSearchErrorState extends LocationSearchState {}
