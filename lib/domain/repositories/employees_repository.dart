import 'package:betonchel_manager/domain/models/employee/employee_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';

abstract interface class EmployeesRepository {
  Future<List<User>> getEmployees();

  Future<OperationStatus> createEmployee(EmployeeData data);
}
