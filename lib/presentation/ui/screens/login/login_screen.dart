import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/layouts/default_screen_layout.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/app_text_field.dart';
import 'package:betonchel_manager/presentation/ui/screens/login/bloc/login_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/login/bloc/login_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/login/dependencies/login_screen_dependencies.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
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
    final strings = context.strings;

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;

        final errorText = state is LoginErrorState ? state.error : null;

        return DefaultScreenLayout(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage(Assets.imagesLogo)),
                    AutofillGroup(
                      child: Column(
                        children: [
                          AppTextField(
                            controller: _loginCubit(context).email,
                            errorText: errorText,
                            autofillHints: const [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            hintText: strings.mail,
                          ),
                          AppTextField(
                            controller: _loginCubit(context).password,
                            obscureText: true,
                            enableSuggestions: false,
                            errorText: errorText,
                            autocorrect: false,
                            autofillHints: const [AutofillHints.password],
                            textInputAction: TextInputAction.done,
                            hintText: strings.password,
                            onSubmitted: (_) => _loginCubit(context).login(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    PrimaryButton(
                      onPressed: _loginCubit(context).login,
                      isLoading: isLoading,
                      child: Text(strings.login),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
