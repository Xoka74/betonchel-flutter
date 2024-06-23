import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'me_api.g.dart';

@RestApi()
@injectable
abstract class MeApi {
  @factoryMethod
  factory MeApi(@Named(InjectionKeys.appDio) Dio dio) = _MeApi;

  @GET('me')
  Future<User> getMe();
}
