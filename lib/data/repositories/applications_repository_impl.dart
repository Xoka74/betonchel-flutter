import 'package:betonchel_manager/data/api/applications_api.dart';
import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/create_application_data.dart';
import 'package:betonchel_manager/domain/repositories/applications_repository.dart';

// @Injectable(as: ApplicationsRepository)
class ApplicationsRepositoryImpl implements ApplicationsRepository {
  final ApplicationsApi _applicationsApi;

  ApplicationsRepositoryImpl(this._applicationsApi);

  @override
  Future<void> createApplication(CreateApplicationData data) => _applicationsApi.createApplication(data);

  @override
  Future<void> deleteApplication(int id) => _applicationsApi.deleteApplication(id);

  @override
  Future<Application> getApplicationById(int id) => _applicationsApi.getApplicationById(id);

  @override
  Future<List<Application>> getApplications(DateTime date) => _applicationsApi.getApplications(date);
}
