import 'package:betonchel_manager/data/api/auth_api.dart';
import 'package:betonchel_manager/data/data_source/auth_data_source.dart';
import 'package:betonchel_manager/data/models/requests/login_request.dart';
import 'package:betonchel_manager/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(
    this._authApi,
    this._authDataSource,
  ) {
    _authDataSource.read();
  }

  @override
  Future<void> login(String email, String password) async {
    final loginRequest = LoginRequest(username: email, password: password);
    final authData = await _authApi.login(loginRequest);

    return _authDataSource.save(authData);
  }

  @override
  Future<void> refreshToken() async {
    final refreshToken = _authDataSource.refreshToken;

    if (refreshToken == null) {
      return;
    }

    final response = await _authApi.refreshTokens(refreshToken);

    await _authDataSource.saveAccessToken(response.accessToken);
  }

  @override
  Future<void> logout() async => _authDataSource.clear();

  @override
  Stream<bool?> get isAuthenticated => _authDataSource.isAuthenticated;
}
