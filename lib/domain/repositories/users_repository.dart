 import 'package:betonchel_manager/domain/models/user/user_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/models/user/user_filters.dart';

abstract interface class UsersRepository {
  Future<List<User>> getUsers(UserFilters filters);

  Future<OperationStatus> createUser(UserData data);

  Future<User> getMe();

  Stream<User?> get user;
}
