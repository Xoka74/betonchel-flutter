import 'package:betonchel_manager/domain/models/location/location.dart';

abstract class LocationsRepository {
  Future<List<Location>> searchLocation(String query);
}
