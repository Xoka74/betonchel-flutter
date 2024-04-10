import 'package:betonchel_manager/data/api/me_api.dart';
import 'package:betonchel_manager/data/data_source/user_data_source.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final MeApi _userApi;
  final UserDataSource _userDataSource;

  UserRepositoryImpl(
    this._userApi,
    this._userDataSource,
  );

  @override
  Future<User> getMe() async {
    final user = await _userApi.getMe();
    _userDataSource.set(user);

    return user;
  }

  @override
  Stream<User> get user => _userDataSource.user;
}
