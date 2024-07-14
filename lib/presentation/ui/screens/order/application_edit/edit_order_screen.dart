import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/loading/loading_screen.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/application_edit/bloc/edit_order_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/application_edit/dependencies/edit_order_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/components/order_form_widget.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_validation_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditOrderScreen extends StatelessWidget implements AutoRouteWrapper {
  final int id;

  const EditOrderScreen({
    super.key,
    @pathParam required this.id,
  });

  @override
  Widget wrappedRoute(BuildContext context) => EditOrderDependencies(
        id: id,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditOrderCubit, FormScreenState>(
      listener: (context, state) {
        if (state is FormSubmittedState) {
          context.router.maybePop();
        }
      },
      builder: (context, state) {
        if (state is FormSubmittingState || state is FormPreparationState) {
          return const LoadingScreen();
        }

        final form = state.form as OrderForm;

        final validationError =
            state is FormValidationFailedState ? state.validationError as OrderValidationError : null;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: OrderFormWidget(
                  form: form,
                  validationError: validationError,
                  onSubmit: context.read<EditOrderCubit>().submitForm,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
