import 'package:betonchel_manager/data/api/me_api.dart';
import 'package:betonchel_manager/data/data_source/user_data_source.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/repositories/me_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@prod
@Injectable(as: MeRepository)
class MeRepositoryImpl implements MeRepository {
  final MeApi _userApi;
  final UserDataSource _userDataSource;

  MeRepositoryImpl(
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
  ValueStream<User?> get user => _userDataSource.userStream;
}
