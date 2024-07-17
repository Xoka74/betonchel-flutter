import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'me_api.g.dart';

@RestApi()
@injectable
abstract class MeApi {
  @factoryMethod
  factory MeApi(Dio dio) = _MeApi;

  @GET('users/me')
  Future<User> getMe();
}
