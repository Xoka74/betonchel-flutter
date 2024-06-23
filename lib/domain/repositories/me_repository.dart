import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class MeRepository {
  Future<User> getMe();

  ValueStream<User?> get user;
}
