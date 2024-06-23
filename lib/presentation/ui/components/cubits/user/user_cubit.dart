import 'dart:async';

import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/repositories/me_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final MeRepository _userRepository;

  late final StreamSubscription<User?> _subscription;

  UserCubit(this._userRepository) : super(UserLoadingState()) {
    _subscription = _userRepository.user.listen(_onUserChanged);
    loadUser();
  }

  void _onUserChanged(User? user) {
    if (user != null) {
      emit(UserLoadedState(user));
    }
  }

  Future<void> loadUser() async {
    emit(UserLoadingState());
    try {
      final user = await _userRepository.getMe();
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserErrorState());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
