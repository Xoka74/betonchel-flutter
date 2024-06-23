import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_list/bloc/employees_list_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_list/bloc/employees_list_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_list/components/employees_list_content.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_list/dependencies/employees_list_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EmployeesListScreen extends StatelessWidget implements AutoRouteWrapper {
  const EmployeesListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => EmployeesListDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<EmployeesListCubit, EmployeesListState>(
        builder: (context, state) => switch (state) {
          EmployeesListLoadingState() => const LoadingScreen(),
          EmployeesListErrorState() => const Text('Error'),
          EmployeesListLoadedState() => EmployeesListContent(employees: state.employees),
        },
      ),
    );
  }
}
