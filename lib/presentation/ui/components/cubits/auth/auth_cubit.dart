import 'dart:async';

import 'package:betonchel_manager/domain/repositories/auth_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/auth/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  late final StreamSubscription<bool?> _subscription;

  AuthCubit(this._authRepository) : super(AuthLoadingState()) {
    _subscription = _authRepository.isAuthenticated.listen(_onAuthChanged);
  }

  void _onAuthChanged(bool? isAuthenticated) {
    final state = switch (isAuthenticated) {
      true => AuthorizedState(),
      false => UnauthorizedState(),
      null => AuthLoadingState(),
    };

    emit(state);
  }

  Future<void> logout() => _authRepository.logout();

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
