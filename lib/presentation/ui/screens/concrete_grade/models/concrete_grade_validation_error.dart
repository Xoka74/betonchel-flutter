import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';

class ConcreteGradeValidationError extends FormValidationError {
  final ValidationError? nameError;
  final ValidationError? markError;
  final ValidationError? clazzError;
  final ValidationError? waterproofTypeError;
  final ValidationError? frostResistanceTypeError;
  final ValidationError? pricePerCubicMeterError;

  const ConcreteGradeValidationError({
    required this.nameError,
    required this.markError,
    required this.clazzError,
    required this.waterproofTypeError,
    required this.frostResistanceTypeError,
    required this.pricePerCubicMeterError,
  });

  @override
  List<Object?> get props => [
    nameError,
    markError,
    clazzError,
    waterproofTypeError,
    frostResistanceTypeError,
    pricePerCubicMeterError,
  ];
}
