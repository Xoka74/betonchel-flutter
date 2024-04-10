sealed class AuthState {}

final class AuthorizedState extends AuthState {}

final class UnauthorizedState extends AuthState {}

final class AuthLoadingState extends AuthState {}
