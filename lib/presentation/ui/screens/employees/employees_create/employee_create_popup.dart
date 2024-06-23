import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/user/user_role.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/dropdown/app_dropdown_button.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/app_text_field.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_create/bloc/employee_create_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/employees_create/dependencies/employee_create_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/shared/models/employee_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/employees/shared/models/employee_form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/user_role_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EmployeeCreatePopup extends StatelessWidget implements AutoRouteWrapper {
  const EmployeeCreatePopup({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => EmployeeCreateDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return BlocConsumer<EmployeeCreateCubit, FormScreenState>(
      listener: (context, state) {
        if (state is FormSubmittedState) {
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        if (state is FormPreparationState) {
          return const LoadingScreen();
        }

        final form = state.form as EmployeeForm;

        final validationError =
            state is FormValidationFailedState ? state.validationError as EmployeeFormValidationError : null;

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                controller: form.fullName,
                labelText: strings.fullName,
                textInputAction: TextInputAction.next,
                errorText: validationError?.fullNameError?.toErrorString(
                  requiredError: strings.thisFieldIsRequired,
                ),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: form.email,
                labelText: strings.email,
                textInputAction: TextInputAction.next,
                errorText: validationError?.emailError?.toErrorString(
                  requiredError: strings.thisFieldIsRequired,
                ),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: form.password,
                labelText: strings.password,
                textInputAction: TextInputAction.next,
                errorText: validationError?.passwordError?.toErrorString(
                  requiredError: strings.thisFieldIsRequired,
                ),
              ),
              const SizedBox(height: 16),
              AppDropdownButton(
                hint: strings.role,
                controller: form.role,
                isExpanded: true,
                items: [
                  ...UserRole.values.map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.title(strings)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                onPressed: context.read<EmployeeCreateCubit>().submitForm,
                child: Text(strings.save),
              ),
            ],
          ),
        );
      },
    );
  }
}
