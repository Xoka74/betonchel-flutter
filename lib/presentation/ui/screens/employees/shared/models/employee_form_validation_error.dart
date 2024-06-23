import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';

class EmployeeFormValidationError extends FormValidationError {
  final ValidationError? emailError;
  final ValidationError? fullNameError;
  final ValidationError? passwordError;
  final ValidationError? roleError;

  const EmployeeFormValidationError({
    required this.emailError,
    required this.fullNameError,
    required this.passwordError,
    required this.roleError,
  });

  @override
  List<Object?> get props => [
        emailError,
        fullNameError,
        passwordError,
        roleError,
      ];
}
