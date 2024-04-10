import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/screens/home/bloc/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenDependencies extends StatelessWidget {
  final Widget child;

  const HomeScreenDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<HomeCubit>(),
      child: child,
    );
  }
}
