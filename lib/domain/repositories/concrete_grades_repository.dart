import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';

abstract interface class ConcreteGradesRepository {
  Future<List<ConcreteGrade>> getConcreteGrades();
}
