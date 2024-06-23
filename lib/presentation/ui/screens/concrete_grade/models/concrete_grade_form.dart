import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade_data.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade_type.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/app_form.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/models/concrete_grade_validation_error.dart';
import 'package:betonchel_manager/utils/validation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConcreteGradeForm extends AppForm {
  final name = ValueNotifier<ConcreteGradeType?>(null);
  final mark = TextEditingController();
  final clazz = TextEditingController();
  final waterproofType = TextEditingController();
  final frostResistanceType = TextEditingController();
  final pricePerCubicMeter = TextEditingController();

  ConcreteGradeData getConcreteGradeData() {
    return ConcreteGradeData(
      name: name.value!,
      mark: mark.text,
      clazz: clazz.text,
      pricePerCubicMeter: double.parse(pricePerCubicMeter.text),
      waterproofType: waterproofType.text,
      frostResistanceType: frostResistanceType.text,
    );
  }

  void setData(ConcreteGrade grade) {
    name.value = grade.name;
    mark.text = grade.mark;
    clazz.text = grade.clazz;
    waterproofType.text = grade.waterproofType ?? '';
    frostResistanceType.text = grade.frostResistanceType ?? '';
    pricePerCubicMeter.text = grade.pricePerCubicMeter.toString();
  }

  @override
  FormValidationError? validate() {
    final nameError = name.value == null ? ValidationError.required : null;
    final markError = ValidationUtils.validateStartsWith(mark.text, markFirstLetter);
    final clazzError = ValidationUtils.validateStartsWith(clazz.text, classFirstLetter);
    final waterproofTypeError = ValidationUtils.validateStartsWith(waterproofType.text, waterproofFirstLetter);
    final frostResistanceTypeError =
        ValidationUtils.validateStartsWith(frostResistanceType.text, frostResistanceFirstLetter);
    final pricePerCubicMeterError = ValidationUtils.validateDouble(pricePerCubicMeter.text);

    final errors = [
      nameError,
      markError,
      clazzError,
      waterproofTypeError,
      frostResistanceTypeError,
      pricePerCubicMeterError,
    ];

    if (errors.any((error) => error != null)) {
      return ConcreteGradeValidationError(
        nameError: nameError,
        markError: markError,
        clazzError: clazzError,
        waterproofTypeError: waterproofTypeError,
        frostResistanceTypeError: frostResistanceTypeError,
        pricePerCubicMeterError: pricePerCubicMeterError,
      );
    }
    return null;
  }

  static const markFirstLetter = 'M';
  static const classFirstLetter = 'B';
  static const waterproofFirstLetter = 'W';
  static const frostResistanceFirstLetter = 'F';
}
