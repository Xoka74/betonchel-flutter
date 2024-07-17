import 'package:betonchel_manager/data/models/requests/register_device_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'fcm_push_api.g.dart';

@RestApi()
@injectable
abstract class FcmPushApi {
  @factoryMethod
  factory FcmPushApi(Dio dio) = _FcmPushApi;

  @POST('fcm/devices/')
  Future<void> registerDevice(@Body() RegisterDeviceRequest request);
}
