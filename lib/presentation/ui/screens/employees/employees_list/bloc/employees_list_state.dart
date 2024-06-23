import 'package:betonchel_manager/domain/models/user/user.dart';

sealed class EmployeesListState {}

class EmployeesListLoadingState extends EmployeesListState {}

class EmployeesListLoadedState extends EmployeesListState {
  final List<User> employees;

  EmployeesListLoadedState(this.employees);
}

class EmployeesListErrorState extends EmployeesListState {}
