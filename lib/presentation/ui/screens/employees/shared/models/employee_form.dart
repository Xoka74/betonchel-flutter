import 'package:betonchel_manager/domain/models/user/user_data.dart';
import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/app_form.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/shared/models/employee_form_validation_error.dart';
import 'package:flutter/cupertino.dart';

class EmployeeForm extends AppForm {
  final email = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final role = ValueNotifier<UserRole?>(null);

  UserData getData() => UserData(
        email: email.text,
        fullName: fullName.text,
        password: password.text,
        role: role.value!,
      );

  @override
  FormValidationError? validate() {
    final emailError = email.text.isEmpty ? ValidationError.required : null;
    final fullNameError = fullName.text.isEmpty ? ValidationError.required : null;
    final passwordError = password.text.isEmpty ? ValidationError.required : null;
    final roleError = role.value == null ? ValidationError.required : null;

    final errors = [
      emailError,
      fullNameError,
      passwordError,
      roleError,
    ];

    if (errors.any((error) => error != null)) {
      return EmployeeFormValidationError(
        emailError: emailError,
        fullNameError: fullNameError,
        passwordError: passwordError,
        roleError: roleError,
      );
    }

    return null;
  }
}
