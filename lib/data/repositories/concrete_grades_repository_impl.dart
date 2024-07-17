import 'package:betonchel_manager/data/api/concrete_grades_api.dart';
import 'package:betonchel_manager/data/repositories/base_repository.dart';
import 'package:betonchel_manager/domain/hubs/event.dart';
import 'package:betonchel_manager/domain/hubs/event_bus.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ConcreteGradesRepository)
class ConcreteGradesRepositoryImpl extends BaseRepository implements ConcreteGradesRepository {
  final ConcreteGradesApi _concreteGradesApi;
  final EventBus _eventBus;

  ConcreteGradesRepositoryImpl(
    this._concreteGradesApi,
    this._eventBus,
    super._tokenVerifier,
  );

  @override
  Future<List<ConcreteGrade>> getConcreteGrades() => withTokenVerification(_concreteGradesApi.getConcreteGrades);

  @override
  Future<ConcreteGrade> getById(int id) async => withTokenVerification(() => _concreteGradesApi.getById(id));

  @override
  Future<OperationStatus> createConcreteGrade(ConcreteGradeData data) => withTokenVerification(
        () async {
          final result = await _concreteGradesApi.createConcreteGrade(data);
          _eventBus.publish(ConcreteGradeCreatedEvent());
          return result;
        },
      );

  @override
  Future<OperationStatus> updateConcreteGrade(int id, ConcreteGradeData data) => withTokenVerification(
        () async {
          final result = await _concreteGradesApi.updateConcreteGrade(id, data);
          _eventBus.publish(ConcreteGradeUpdatedEvent());
          return result;
        },
      );
}
