import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_edit/bloc/concrete_grade_edit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConcreteGradeEditDependencies extends StatelessWidget {
  final Widget child;
  final int id;

  const ConcreteGradeEditDependencies({
    super.key,
    required this.child,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ConcreteGradeEditCubit>(
        param1: id,
      ),
      child: child,
    );
  }
}
