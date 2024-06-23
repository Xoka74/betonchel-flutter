import 'package:betonchel_manager/data/constants/storage_keys.dart';
import 'package:betonchel_manager/domain/models/auth/auth_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class AuthDataSource {
  final FlutterSecureStorage _storage;

  final _isAuthenticated = BehaviorSubject<bool?>();

  late final isAuthenticated = _isAuthenticated.stream.distinct();

  String? accessToken;
  String? refreshToken;

  AuthDataSource(this._storage);

  Future<void> read() async {
    accessToken = await _storage.read(key: StorageKeys.accessToken);
    refreshToken = await _storage.read(key: StorageKeys.refreshToken);

    final tokens = [accessToken, refreshToken];

    if (tokens.any((element) => element == null)) {
      return _update(false);
    }

    return _update(true);
  }

  Future<void> save(AuthData authData) async {
    await _storage.write(key: StorageKeys.accessToken, value: authData.accessToken);
    await _storage.write(key: StorageKeys.refreshToken, value: authData.refreshToken);

    accessToken = authData.accessToken;
    refreshToken = authData.refreshToken;

    return _update(true);
  }

  Future<void> clear() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.refreshToken);

    return _update(false);
  }

  void _update(bool isAuthenticated) => _isAuthenticated.sink.add(isAuthenticated);
}
