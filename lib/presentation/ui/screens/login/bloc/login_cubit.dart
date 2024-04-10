import 'package:betonchel_manager/domain/repositories/auth_repository.dart';
import 'package:betonchel_manager/presentation/ui/screens/login/bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  final email = TextEditingController();
  final password = TextEditingController();

  LoginCubit(this._authRepository) : super(LoginInitialState());

  Future<void> login() => _authRepository.login(email.text, password.text);
}
