import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';

class ValidationUtils {
  static ValidationError? validateDouble(String value) {
    if (value.isEmpty) {
      return ValidationError.required;
    }

    if (double.tryParse(value) == null) {
      return ValidationError.invalid;
    }

    return null;
  }

  static ValidationError? validateStartsWith(String item, String letter) {
    if (item.isEmpty) {
      return ValidationError.required;
    }

    if (!item.startsWith(letter)) {
      return ValidationError.invalid;
    }

    return null;
  }
}
