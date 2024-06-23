import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_list/bloc/application_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationListDependencies extends StatelessWidget {
  final Widget child;

  const ApplicationListDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ApplicationListCubit>(),
      child: child,
    );
  }
}
