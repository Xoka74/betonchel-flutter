import 'package:betonchel_manager/domain/repositories/users_repository.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/shared/models/employee_form.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeeCreateCubit extends FormScreenCubit<EmployeeForm> {
  final EmployeesRepository _employeesRepository;

  EmployeeCreateCubit(this._employeesRepository) : super(EmployeeForm());

  @override
  Future<void> sendForm() async {
    emit(FormSubmittingState(form));

    final data = form.getData();

    try {
      final result = _employeesRepository.createEmployee(data);
      emit(FormSubmittedState(form));
    } catch (err) {
      emit(FormSubmissionFailedState(form));
    }
  }
}
