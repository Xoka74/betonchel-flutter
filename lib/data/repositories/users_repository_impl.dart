import 'package:betonchel_manager/data/api/users_api.dart';
import 'package:betonchel_manager/data/data_source/user_data_source.dart';
import 'package:betonchel_manager/data/repositories/base_repository.dart';
import 'package:betonchel_manager/data/token/token_verifier.dart';
import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/models/user/user_data.dart';
import 'package:betonchel_manager/domain/models/user/user_filters.dart';
import 'package:betonchel_manager/domain/repositories/users_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl extends BaseRepository implements UsersRepository {
  final UsersApi _userApi;
  final UserDataSource _userDataSource;
  final EventBus _eventBus;

  UsersRepositoryImpl(
    this._userApi,
    this._userDataSource,
    this._eventBus,
    TokenVerifier tokenVerifier,
  ) : super(tokenVerifier);

  @override
  Future<User> getMe() async {
    final user = await _userApi.getMe();
    _userDataSource.set(user);

    return user;
  }

  @override
  Stream<User?> get user => _userDataSource.userStream;

  @override
  Future<List<User>> getUsers(UserFilters filters) => withTokenVerification(() => _userApi.getUsers(filters));

  @override
  Future<OperationStatus> createUser(UserData data) {
    return withTokenVerification(() async {
      final result = await _userApi.createUser(data);
      _eventBus.publish(UserCreatedEvent());
      return result;
    });
  }
}
