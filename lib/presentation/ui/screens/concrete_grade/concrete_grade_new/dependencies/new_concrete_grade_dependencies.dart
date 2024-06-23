import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_new/bloc/new_concrete_grade_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewConcreteGradeDependencies extends StatelessWidget {
  final Widget child;

  const NewConcreteGradeDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<NewConcreteGradeCubit>(),
      child: child,
    );
  }
}
