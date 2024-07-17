import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/web_router.gr.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/auth/auth_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebAuthRouter extends StatelessWidget {
  const WebAuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (handler) => [
            ...switch (state) {
              AuthorizedState() => handler.peek ?? [const HomeRootPage()],
              UnauthorizedState() => [const UnauthorizedPage()],
              AuthLoadingState() => [const LoadingPage()],
            }
          ],
        );
      },
    );
  }
}
