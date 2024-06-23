import 'package:betonchel_manager/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenVerifier {
  final AuthRepository _authRepository;

  TokenVerifier(this._authRepository){
    print('TokenVerifierCreated');
  }

  Future<T> withTokenVerification<T>(Future<T> Function() request) async {
    try {
      print('withTokenVerification');
      final result = await request();
      print('Result = $result');
      return result;
    } catch (err) {
      print('OnException');
      // if (err.response?.statusCode == 401) {
        await _regenerateAccessTokenWithErrorHandling();

        return request();
      // }

      // rethrow;
    }
  }

  Future<void> _regenerateAccessTokenWithErrorHandling() async {
    print('_regenerateAccessTokenWithErrorHandling');
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
