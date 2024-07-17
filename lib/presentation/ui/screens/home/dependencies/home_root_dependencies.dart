import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/domain/repositories/push_notifications_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:betonchel_manager/services/background_push_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeRootDependencies extends StatelessWidget {
  final Widget child;

  const HomeRootDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => BackgroundPushService(
        locator<PushNotificationsRepository>(),
      ),
      lazy: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<UserCubit>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
