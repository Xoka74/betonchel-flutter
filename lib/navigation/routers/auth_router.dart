import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/auth/auth_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final initialRoute = switch (state) {
          AuthorizedState() => const AuthorizedPage(),
          UnauthorizedState() => const UnauthorizedPage(),
          AuthLoadingState() => const LoadingPage(),
        };

        return AutoRouter.declarative(
          routes: (handler) => [
            initialRoute,
          ],
        );
      },
    );
  }
}
