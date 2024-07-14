import 'package:betonchel_manager/data/api/employees_api.dart';
import 'package:betonchel_manager/data/repositories/base_repository.dart';
import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/user/user_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/user/user.dart';
import 'package:betonchel_manager/domain/repositories/users_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EmployeesRepository)
class EmployeesRepositoryImpl extends BaseRepository implements EmployeesRepository {
  final EmployeesApi _employeesApi;
  final EventBus _eventBus;

  EmployeesRepositoryImpl(
    this._employeesApi,
    this._eventBus,
    super._tokenVerifier,
  );

  @override
  Future<List<User>> getEmployees() => withTokenVerification(_employeesApi.getEmployees);

  @override
  Future<OperationStatus> createEmployee(UserData data) {
    return withTokenVerification(() async {
      final result = await _employeesApi.createEmployee(data);
      _eventBus.publish(EmployeeCreatedEvent());
      return result;
    });
  }
}
