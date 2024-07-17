import 'package:betonchel_manager/domain/models/user/user.dart';

abstract interface class MeRepository {
  Future<User> getMe();

  Stream<User?> get user;
}
