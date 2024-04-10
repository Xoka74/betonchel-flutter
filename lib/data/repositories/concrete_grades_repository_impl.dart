import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ConcreteGradesRepository)
class ConcreteGradesRepositoryImpl implements ConcreteGradesRepository {
  @override
  Future<List<ConcreteGrade>> getConcreteGrades() async {
    return [];
  }
}
