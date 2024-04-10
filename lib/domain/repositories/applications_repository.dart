import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/create_application_data.dart';

abstract interface class ApplicationsRepository {
  Future<List<Application>> getApplications(DateTime date);
  Future<Application> getApplicationById(int id);

  Future<void> createApplication(CreateApplicationData data);
  Future<void> deleteApplication(int id);
}
