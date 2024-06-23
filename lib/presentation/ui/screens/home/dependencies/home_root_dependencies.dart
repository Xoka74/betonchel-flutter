import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/notifications/notifications_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRootDependencies extends StatelessWidget {
  final Widget child;

  const HomeRootDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<UserCubit>(),
        ),
        BlocProvider(
          create: (_) => locator<NotificationsCubit>(),
        ),
      ],
      child: child,
    );
  }
}
