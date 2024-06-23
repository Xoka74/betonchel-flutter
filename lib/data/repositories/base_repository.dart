import 'package:betonchel_manager/data/token/token_verifier.dart';

abstract class BaseRepository {
  final TokenVerifier _tokenVerifier;

  const BaseRepository(this._tokenVerifier);

  Future<T> withTokenVerification<T>(Future<T> Function() apiRequest) =>
      _tokenVerifier.withTokenVerification(apiRequest);

  Future<T> handleRequest<T>(Future<T> Function() apiRequest, [bool enableErrorHandling = true]) {
    return withTokenVerification(apiRequest);
  }
}
