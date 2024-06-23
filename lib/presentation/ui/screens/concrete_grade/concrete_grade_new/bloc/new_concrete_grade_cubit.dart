import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewConcreteGradeCubit extends FormScreenCubit<ConcreteGradeForm> {
  final ConcreteGradesRepository _repository;

  NewConcreteGradeCubit(this._repository) : super(ConcreteGradeForm());

  @override
  Future<void> sendForm() async {
    final data = form.getConcreteGradeData();

    // try {
    await _repository.createConcreteGrade(data);
    emit(FormSubmittedState(form));
    // } catch (e) {
    //   emit(FormSubmissionFailedState(form));
    // }
  }
}
