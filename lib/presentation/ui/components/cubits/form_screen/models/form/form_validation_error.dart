import 'package:equatable/equatable.dart';

/// Class representing a validation error for a form.
/// Usually contains a [ValidationError] field for each form field
abstract class FormValidationError extends Equatable {
  const FormValidationError();
}
