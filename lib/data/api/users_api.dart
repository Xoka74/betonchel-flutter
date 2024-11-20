import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/models/user/user_data.dart';
import 'package:betonchel_manager/domain/models/user/user_filters.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api.g.dart';

@RestApi()
@injectable
abstract class UsersApi {
  @factoryMethod
  factory UsersApi(Dio dio) = _UsersApi;

  @GET('users/me')
  Future<User> getMe();

  @GET('employees')
  Future<List<User>> getUsers(UserFilters filters);

  @GET('employees/{id}')
  Future<User> getById(@Path() int id);

  @POST('employees/create')
  Future<OperationStatus> createUser(@Body() UserData data);
}
