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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        final stack = switch (state) {
          AuthorizedState() => context.router.pendingRoutesHandler.peek ?? [const HomeRootPage()],
          UnauthorizedState() => const [UnauthorizedPage()],
          AuthLoadingState() => const [LoadingPage()],
        };
        context.router.replaceAll(stack);
      },
      builder: (context, state) {
        return const AutoRouter();
      },
    );
  }
}
