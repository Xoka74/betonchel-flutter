import 'package:betonchel_manager/data/models/requests/access_token_response.dart';

abstract interface class AuthRepository {
  Stream<bool?> get isAuthenticated;

  Future<void> login(String email, String password);

  Future<void> refreshToken();

  Future<void> logout();
}
