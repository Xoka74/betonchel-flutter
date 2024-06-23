import 'package:betonchel_manager/domain/models/concrete/concrete_grade_type.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/dropdown/app_dropdown_button.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/app_text_field.dart';
import 'package:betonchel_manager/presentation/ui/components/text_fields/decimal_input_field.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_form.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_validation_error.dart';
import 'package:betonchel_manager/utils/extensions/concrete_grade_type_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ConcreteGradeFormWidget extends StatelessWidget {
  final ConcreteGradeForm form;
  final ConcreteGradeValidationError? validationError;
  final VoidCallback onSubmit;

  const ConcreteGradeFormWidget({
    super.key,
    required this.form,
    required this.onSubmit,
    required this.validationError,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDropdownButton(
          hint: strings.concreteGrade,
          controller: form.name,
          isExpanded: true,
          items: [
            ...ConcreteGradeType.values.map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.title(strings)),
              ),
            )
          ],
        ),
        AppTextField(
          controller: form.mark,
          labelText: strings.mark,
          textInputAction: TextInputAction.next,
          errorText: validationError?.markError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.shouldStartWithLetter(ConcreteGradeForm.markFirstLetter),
          ),
        ),
        AppTextField(
          controller: form.clazz,
          labelText: strings.clazz,
          textInputAction: TextInputAction.next,
          errorText: validationError?.clazzError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.shouldStartWithLetter(ConcreteGradeForm.classFirstLetter),
          ),
        ),
        AppTextField(
          controller: form.waterproofType,
          labelText: strings.waterproof,
          textInputAction: TextInputAction.next,
          errorText: validationError?.waterproofTypeError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.shouldStartWithLetter(ConcreteGradeForm.waterproofFirstLetter),
          ),
        ),
        AppTextField(
          controller: form.frostResistanceType,
          labelText: strings.frostResistance,
          errorText: validationError?.frostResistanceTypeError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.shouldStartWithLetter(ConcreteGradeForm.frostResistanceFirstLetter),
          ),
          textInputAction: TextInputAction.next,
        ),
        DecimalInputField(
          controller: form.pricePerCubicMeter,
          labelText: strings.pricePerCubicMeter,
          errorText: validationError?.pricePerCubicMeterError?.toErrorString(
            requiredError: strings.thisFieldIsRequired,
            invalidError: strings.invalidDoubleField,
          ),
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 8),
        const SizedBox(height: 8),
        PrimaryButton(
          onPressed: onSubmit,
          child: Text(strings.save),
        ),
      ],
    );
  }
}
