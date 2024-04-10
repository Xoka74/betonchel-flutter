import 'package:betonchel_manager/domain/models/user/user.dart';

abstract interface class UserRepository {
  Future<User> getMe();

  Stream<User> get user;
}
