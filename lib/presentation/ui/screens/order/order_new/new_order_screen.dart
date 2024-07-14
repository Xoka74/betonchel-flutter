import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_new/bloc/new_order_cubit.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/order_new/dependencies/new_order_screen_dependencies.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/components/order_form_widget.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_validation_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewOrderScreen extends StatelessWidget implements AutoRouteWrapper {
  final DateTime? deliveryDate;

  const NewOrderScreen({
    super.key,
    this.deliveryDate,
  });

  @override
  Widget wrappedRoute(BuildContext context) => NewOrderScreenDependencies(
        deliveryDate: deliveryDate,
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewOrderCubit, FormScreenState>(
      listener: (context, state) {
        if (state is FormSubmittedState) {
          context.maybePop();
        }
      },
      builder: (context, state) {
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
                  onSubmit: context.read<NewOrderCubit>().submitForm,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
