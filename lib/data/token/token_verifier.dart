import 'package:betonchel_manager/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenVerifier {
  final AuthRepository _authRepository;

  TokenVerifier(this._authRepository);

  Future<T> withTokenVerification<T>(Future<T> Function() request) async {
    try {
      final result = await request();
      return result;
    } catch (err) {
      await _regenerateAccessTokenWithErrorHandling();

      return request();
    }
  }

  Future<void> _regenerateAccessTokenWithErrorHandling() async {
    try {
      await _authRepository.refreshTokens();
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        await _authRepository.logout();
      }
      rethrow;
    }
  }
}
