import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_edit/bloc/edit_application_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/application_edit/dependencies/edit_application_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/components/application_form_widget.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/models/application_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/application/shared/models/application_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditApplicationScreen extends StatelessWidget implements AutoRouteWrapper {
  final int id;

  const EditApplicationScreen({
    super.key,
    @pathParam required this.id,
  });

  @override
  Widget wrappedRoute(BuildContext context) => EditApplicationDependencies(
        id: id,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditApplicationCubit, FormScreenState>(
      listener: (context, state) {
        if (state is FormSubmittedState) {
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        if (state is FormSubmittingState || state is FormPreparationState) {
          return const LoadingScreen();
        }

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
                  onSubmit: context.read<EditApplicationCubit>().submitForm,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
