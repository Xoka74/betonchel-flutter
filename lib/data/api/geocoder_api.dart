import 'package:betonchel_manager/domain/models/location/location.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'geocoder_api.g.dart';

@RestApi()
@injectable
abstract class GeocoderApi {
  @factoryMethod
  factory GeocoderApi(Dio dio) = _GeocoderApi;

  @POST('geocoder/search/')
  Future<List<Location>> searchLocation(@Field() String text);
}
