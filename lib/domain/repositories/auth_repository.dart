abstract interface class AuthRepository {
  Stream<bool?> get isAuthenticated;

  Future<void> login(String email, String password);

  Future<void> refreshToken();

  Future<void> logout();

  Future<void> setup();
}
