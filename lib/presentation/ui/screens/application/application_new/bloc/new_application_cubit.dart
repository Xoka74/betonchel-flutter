import 'package:betonchel_manager/domain/repositories/applications_repository.dart';
import 'package:betonchel_manager/domain/repositories/concrete_grades_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/models/application_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewApplicationCubit extends FormScreenCubit<ApplicationForm> {
  final ApplicationsRepository _applicationsRepository;
  final ConcreteGradesRepository _concreteGradesRepository;
  final DateTime? _initialDeliveryDate;

  NewApplicationCubit(
    @factoryParam this._initialDeliveryDate,
    this._applicationsRepository,
    this._concreteGradesRepository,
  ) : super(ApplicationForm());

  @override
  Future<void> prepareData() async {
    try {
      form.deliveryDateTime.value = _initialDeliveryDate ?? DateTime.now();
      final concreteGrades = await _concreteGradesRepository.getConcreteGrades();

      form.allConcreteGrades.value = concreteGrades;

      emit(FormEditingState(form));
    } catch (e) {
      emit(FormPreparationFailedState(form));
    }
  }

  @override
  Future<void> sendForm() async {
    final data = form.getApplicationData();

    try {
      await _applicationsRepository.createApplication(data);
      emit(FormSubmittedState(form));
    } catch (e) {
      emit(FormSubmissionFailedState(form));
    }
  }
}
