import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_list/bloc/employees_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesListDependencies extends StatelessWidget {
  final Widget child;

  const EmployeesListDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<EmployeesListCubit>(),
      child: child,
    );
  }
}
