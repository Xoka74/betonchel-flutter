import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConcreteGradeEditCubit extends FormScreenCubit<ConcreteGradeForm> {
  final int _id;
  final ConcreteGradesRepository _concreteGradeRepository;

  ConcreteGradeEditCubit(
    @factoryParam this._id,
    this._concreteGradeRepository,
  ) : super(ConcreteGradeForm());

  @override
  Future<void> prepareData() async {
    emit(FormPreparationState(form));
    try {
      final concreteGrade = await _concreteGradeRepository.getById(_id);
      form.setData(concreteGrade);

      emit(FormEditingState(form));
    } catch (e) {
      emit(FormPreparationFailedState(form));
    }
  }

  @override
  Future<void> sendForm() async {
    final data = form.getConcreteGradeData();

    try {
      await _concreteGradeRepository.updateConcreteGrade(_id, data);
      emit(FormSubmittedState(form));
    } catch (e) {
      emit(FormSubmissionFailedState(form));
    }
  }
}
