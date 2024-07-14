import 'package:betonchel_manager/data/models/requests/login_request.dart';
import 'package:betonchel_manager/data/models/requests/refresh_tokens_request.dart';
import 'package:betonchel_manager/domain/models/auth/auth_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('token')
  Future<AuthData> login(@Body() LoginRequest loginRequest);

  @POST('token/refresh')
  Future<AuthData> refreshTokens(@Body() RefreshTokensRequest refreshTokensRequest);
}
