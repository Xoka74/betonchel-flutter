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

  AuthDataSource(this._storage);

  Future<void> read() async {
    final accessToken = await _storage.read(key: StorageKeys.accessToken);
    final refreshToken = await _storage.read(key: StorageKeys.refreshToken);
    final tokens = [accessToken, refreshToken];

    if (tokens.any((element) => element == null)) {
      return _update(false);
    }

    return _update(true);
  }

  Future<void> update(AuthData authData) async {
    await _storage.write(key: StorageKeys.accessToken, value: authData.accessToken);
    await _storage.write(key: StorageKeys.refreshToken, value: authData.refreshToken);

    return _update(true);
  }

  void _update(bool isAuthenticated) => _isAuthenticated.sink.add(isAuthenticated);

  Future<void> clear() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.refreshToken);

    return _update(false);
  }
}
