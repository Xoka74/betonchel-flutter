import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/dropdown/app_dropdown_button.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/date_pickers/app_date_time_field.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/app_text_field.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/decimal_input_field.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_validation_error.dart';
import 'package:betonchel_manager/utils/extensions/order_status_extension.dart';
import 'package:betonchel_manager/utils/extensions/concrete_grade_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OrderFormWidget extends StatelessWidget {
  final OrderForm form;
  final OrderValidationError? validationError;
  final VoidCallback onSubmit;

  const OrderFormWidget({
    super.key,
    required this.form,
    required this.validationError,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: form.customerName,
          labelText: strings.customerName,
          textInputAction: TextInputAction.next,
          errorText: validationError?.customerNameError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
          ),
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: form.contactData,
          labelText: strings.contactData,
          textInputAction: TextInputAction.next,
          errorText: validationError?.contactDataError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
          ),
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: form.deliveryAddress,
          labelText: strings.deliveryAddress,
          textInputAction: TextInputAction.next,
          errorText: validationError?.deliveryAddressError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
          ),
        ),
        const SizedBox(height: 16),
        AppDateTimeField(
          controller: form.deliveryDateTime,
          labelText: strings.deliveryDateTime,
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder(
          valueListenable: form.allConcreteGrades,
          builder: (context, grades, child) {
            return AppDropdownButton(
              controller: form.concreteGrade,
              hint: strings.concreteGrade,
              isExpanded: true,
              items: [
                ...grades.map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.shortTitle(strings)),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        AppDropdownButton(
          controller: form.status,
          hint: strings.orderStatus,
          isExpanded: true,
          items: [
            ...OrderStatus.values.map(
              (status) => DropdownMenuItem(
                value: status,
                child: Text(status.title(strings)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: form.description,
          labelText: strings.description,
          maxLines: 5,
        ),
        const SizedBox(height: 16),
        DecimalInputField(
          controller: form.volume,
          labelText: strings.scrapVolumeCubes,
          textInputAction: TextInputAction.next,
          errorText: validationError?.totalPriceError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.invalidDoubleField,
          ),
        ),
        const SizedBox(height: 16),
        DecimalInputField(
          controller: form.totalPrice,
          labelText: strings.totalPrice,
          textInputAction: TextInputAction.next,
          errorText: validationError?.totalPriceError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.invalidDoubleField,
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          onPressed: onSubmit,
          child: Text(strings.save),
        ),
      ],
    );
  }
}
