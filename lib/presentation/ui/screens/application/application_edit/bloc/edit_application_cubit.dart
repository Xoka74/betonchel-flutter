import 'package:betonchel_manager/domain/repositories/applications_repository.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/models/application_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditApplicationCubit extends FormScreenCubit<ApplicationForm> {
  final ApplicationsRepository _applicationsRepository;
  final ConcreteGradesRepository _concreteGradesRepository;
  final int id;

  EditApplicationCubit(
    @factoryParam this.id,
    this._applicationsRepository,
    this._concreteGradesRepository,
  ) : super(ApplicationForm());

  @override
  Future<void> prepareData() async {
    emit(FormPreparationState(form));

    try {
      final application = await _applicationsRepository.getApplicationById(id);
      final concreteGrades = await _concreteGradesRepository.getConcreteGrades();
      form.allConcreteGrades.value = concreteGrades;

      form.setData(application);
      emit(FormEditingState(form));
    } catch (err) {
      emit(FormPreparationFailedState(form));
    }
  }

  @override
  Future<void> sendForm() async {
    final data = form.getApplicationData();

    emit(FormSubmittingState(form));

    try {
      final result = await _applicationsRepository.editApplication(id, data);
      emit(FormSubmittedState(form));
    } catch (err) {
      emit(FormSubmissionFailedState(form));
    }
  }
}
