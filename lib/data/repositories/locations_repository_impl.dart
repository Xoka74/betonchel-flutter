import 'package:betonchel_manager/data/api/geocoder_api.dart';
import 'package:betonchel_manager/domain/models/location/location.dart';
import 'package:betonchel_manager/domain/repositories/locations_repository.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocationsRepository)
class LocationsRepositoryImpl implements LocationsRepository {
  final GeocoderApi _geocoderApi;

  LocationsRepositoryImpl(this._geocoderApi);

  @override
  Future<List<Location>> searchLocation(String query) async {
    try {
      // return await _searchLocationOnMobile(query);
      return _searchLocationOnBackend(query);
    } on MissingPluginException catch (_) {
      return _searchLocationOnBackend(query);
    }
  }

  Future<List<Location>> _searchLocationOnBackend(String query) async => _geocoderApi.searchLocation(query);

  Future<List<Location>> _searchLocationOnMobile(String query) async {
    // final search = await YandexSearch.searchByText(
    //   searchText: query,
    //   geometry: Geometry.fromPoint(
    //     const Point(
    //       latitude: 55.204772,
    //       longitude: 61.282188,
    //     ),
    //   ),
    //   searchOptions: const SearchOptions(
    //     searchType: SearchType.geo,
    //     geometry: false,
    //   ),
    // );

    // final result = await search.$2;
    // final items = result.items ?? <SearchItem>[];

    final locations = <Location>[];

    // for (final item in items) {
    //   final point = item.geometry.firstOrNull?.point;
    //   final name = item.toponymMetadata?.address.formattedAddress;
    //
    //   if (name == null) {
    //     continue;
    //   }
    //
    //   if (point == null) {
    //     continue;
    //   }
    //
    //   locations.add(
    //     Location(
    //       name: name,
    //       latitude: point.latitude,
    //       longitude: point.longitude,
    //     ),
    //   );
    // }

    return locations;
  }
}
