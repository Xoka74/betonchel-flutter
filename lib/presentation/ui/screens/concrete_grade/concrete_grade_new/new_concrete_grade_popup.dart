import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/components/concrete_grade_form_widget.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_new/bloc/new_concrete_grade_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_new/dependencies/new_concrete_grade_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewConcreteGradePopup extends StatelessWidget implements AutoRouteWrapper {
  const NewConcreteGradePopup({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => NewConcreteGradeDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewConcreteGradeCubit, FormScreenState>(
      listener: (context, state) {
        if (state is FormSubmittedState) {
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        if (state is FormPreparationState) {
          return const LoadingScreen();
        }

        final form = state.form as ConcreteGradeForm;

        final validationError =
            state is FormValidationFailedState ? state.validationError as ConcreteGradeValidationError : null;

        return AlertDialog(
          content: ConcreteGradeFormWidget(
            form: form,
            validationError: validationError,
            onSubmit: context.read<NewConcreteGradeCubit>().submitForm,
          ),
        );
      },
    );
  }
}
