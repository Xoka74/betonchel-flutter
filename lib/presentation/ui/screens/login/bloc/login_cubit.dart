import 'package:betonchel_manager/domain/repositories/auth_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/base/initializable_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/login/bloc/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class LoginCubit extends InitializableCubit<LoginState> {
  final AuthRepository _authRepository;
  final Logger _logger;

  final email = TextEditingController();
  final password = TextEditingController();

  LoginCubit(this._authRepository, this._logger) : super(LoginInitialState());

  @override
  void initialize() {
    email.addListener(_resetState);
    password.addListener(_resetState);
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    try {
      final data = await _authRepository.login(email.text, password.text);
      emit(LoginInitialState());
    } catch (err) {
      emit(LoginErrorState(err.toString()));
    }
  }

  void _resetState() {
    if (state is LoginErrorState) {
      emit(LoginInitialState());
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();

    return super.close();
  }
}
