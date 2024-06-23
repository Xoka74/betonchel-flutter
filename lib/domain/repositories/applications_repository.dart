import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/application_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/filters/application_filters.dart';

abstract interface class ApplicationsRepository {
  Future<List<Application>> getApplications(ApplicationFilters filters);
  Future<Application> getApplicationById(int id);

  Future<OperationStatus> createApplication(ApplicationData data);
  Future<OperationStatus> editApplication(int id, ApplicationData data);

  Future<OperationStatus> deleteApplication(int id);
}
