import 'package:betonchel_manager/di/constants/injection_keys.dart';
import 'package:betonchel_manager/domain/models/employee/employee_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'employees_api.g.dart';

@RestApi()
@injectable
abstract class EmployeesApi {
  @factoryMethod
  factory EmployeesApi(@Named(InjectionKeys.appDio) Dio dio) = _EmployeesApi;

  @GET('employees')
  Future<List<User>> getEmployees();

  @GET('employees/{id}')
  Future<User> getById(@Path() int id);

  @POST('employees/create')
  Future<OperationStatus> createEmployee(@Body() EmployeeData data);
}
