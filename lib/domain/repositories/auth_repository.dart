abstract interface class AuthRepository {
  Stream<bool?> get isAuthenticated;

  Future<void> login(String email, String password);

  Future<void> refreshTokens();

  Future<void> logout();
}
