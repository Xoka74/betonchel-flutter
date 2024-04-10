import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/components/layouts/default_screen_layout.dart';
import 'package:betonchel_manager/presentation/screens/login/bloc/login_cubit.dart';
import 'package:betonchel_manager/presentation/screens/login/bloc/login_state.dart';
import 'package:betonchel_manager/presentation/screens/login/dependencies/login_screen_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => LoginScreenDependencies(child: this);

  LoginCubit _loginCubit(BuildContext context) => context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;

        return DefaultScreenLayout(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _loginCubit(context).email,
                ),
                TextField(
                  controller: _loginCubit(context).password,
                ),
                TextButton(
                  onPressed: _loginCubit(context).login,
                  child: isLoading ? const CircularProgressIndicator() : const Text('Login'),
                ),
                if (state is LoginErrorState)
                  const Text(
                    'Unknown error',
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
