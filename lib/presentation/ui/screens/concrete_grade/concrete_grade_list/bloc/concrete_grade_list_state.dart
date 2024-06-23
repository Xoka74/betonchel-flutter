import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';

sealed class ConcreteGradeListState {}

final class ConcreteGradeListLoadedState extends ConcreteGradeListState {
  final List<ConcreteGrade> concreteGrades;

  ConcreteGradeListLoadedState(this.concreteGrades);
}

final class ConcreteGradeListLoadingState extends ConcreteGradeListState {}

final class ConcreteGradeListErrorState extends ConcreteGradeListState {
  final String error;

  ConcreteGradeListErrorState(this.error);
}
