import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_create/bloc/employee_create_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCreateDependencies extends StatelessWidget {
  final Widget child;

  const EmployeeCreateDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<EmployeeCreateCubit>(),
      child: child,
    );
  }
}
