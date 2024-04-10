import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthorizedRouter extends AutoRouter {
  const AuthorizedRouter({super.key});

  @override
  Widget Function(BuildContext context, Widget content)? get builder => _builder;

  Widget _builder(BuildContext context, Widget content) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<UserCubit>(),
        ),
      ],
      child: content,
    );
  }
}
