import 'package:betonchel_manager/data/api/applications_api.dart';
import 'package:betonchel_manager/data/repositories/base_repository.dart';
import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/application/application.dart';
import 'package:betonchel_manager/domain/models/application/application_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/models/filters/application_filters.dart';
import 'package:betonchel_manager/domain/repositories/applications_repository.dart';
import 'package:injectable/injectable.dart';

@prod
@Injectable(as: ApplicationsRepository)
class ApplicationsRepositoryImpl extends BaseRepository implements ApplicationsRepository {
  final ApplicationsApi _applicationsApi;
  final EventBus _eventBus;

  ApplicationsRepositoryImpl(
    this._applicationsApi,
    this._eventBus,
    super._tokenVerifier,
  );

  @override
  Future<OperationStatus> createApplication(ApplicationData data) => withTokenVerification(() async {
        final result = await _applicationsApi.createApplication(data);
        _eventBus.publish(ApplicationCreatedEvent());
        return result;
      });

  @override
  Future<OperationStatus> editApplication(int id, ApplicationData data) => withTokenVerification(() async {
        final result = await _applicationsApi.editApplication(id, data);
        _eventBus.publish(ApplicationUpdatedEvent());
        return result;
      });

  @override
  Future<OperationStatus> deleteApplication(int id) =>
      withTokenVerification(() => _applicationsApi.deleteApplication(id));

  @override
  Future<Application> getApplicationById(int id) =>
      withTokenVerification(() => _applicationsApi.getApplicationById(id));

  @override
  Future<List<Application>> getApplications(ApplicationFilters filters) =>
      withTokenVerification(() => _applicationsApi.getApplications(filters));
}
