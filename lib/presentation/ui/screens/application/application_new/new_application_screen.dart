import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_new/bloc/new_application_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_new/dependencies/new_application_screen_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/components/application_form_widget.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/models/application_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/models/application_validation_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewApplicationScreen extends StatelessWidget implements AutoRouteWrapper {
  final DateTime? deliveryDate;

  const NewApplicationScreen({
    super.key,
    this.deliveryDate,
  });

  @override
  Widget wrappedRoute(BuildContext context) => NewApplicationScreenDependencies(
        deliveryDate: deliveryDate,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewApplicationCubit, FormScreenState>(
      listener: (context, state) {
        if (state is FormSubmittedState) {
          context.maybePop();
        }
      },
      builder: (context, state) {
        final form = state.form as ApplicationForm;

        final validationError =
            state is FormValidationFailedState ? state.validationError as ApplicationValidationError : null;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: ApplicationFormWidget(
                  form: form,
                  validationError: validationError,
                  onSubmit: context.read<NewApplicationCubit>().submitForm,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
