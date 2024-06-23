import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade_data.dart';
import 'package:betonchel_manager/domain/models/error/operation_status.dart';

abstract interface class ConcreteGradesRepository {
  Future<List<ConcreteGrade>> getConcreteGrades();

  Future<ConcreteGrade> getById(int id);

  Future<OperationStatus> updateConcreteGrade(int id, ConcreteGradeData data);

  Future<OperationStatus> createConcreteGrade(ConcreteGradeData data);
}
