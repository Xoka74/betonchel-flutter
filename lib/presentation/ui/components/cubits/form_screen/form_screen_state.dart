import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/app_form.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:equatable/equatable.dart';

abstract class FormScreenState extends Equatable {
  final AppForm form;

  const FormScreenState(this.form);

  @override
  List<Object?> get props => [form];
}

abstract interface class EditableState {}

abstract class FormErrorState extends FormScreenState {
  const FormErrorState(super.form);
}

// Preparation
class FormPreparationState extends FormScreenState {
  const FormPreparationState(super.form);
}

class FormPreparationFailedState extends FormErrorState {
  const FormPreparationFailedState(super.form);
}

// Editing
class FormEditingState extends FormScreenState implements EditableState {
  const FormEditingState(super.form);
}

// Validation
class FormValidationFailedState extends FormScreenState implements EditableState {
  final FormValidationError validationError;

  const FormValidationFailedState(super.form, this.validationError);

  @override
  List<Object?> get props => [form, validationError];
}

// Confirmation
class FormNeedsConfirmationState<T> extends FormScreenState {
  final T? data;

  const FormNeedsConfirmationState(super.form, {this.data});

  @override
  List<Object?> get props => [form, data];
}

// Submitting
class FormSubmittingState extends FormScreenState implements EditableState {
  const FormSubmittingState(super.form);
}

class FormSubmittedState<T> extends FormScreenState implements EditableState {
  final T? data;

  const FormSubmittedState(super.form, {this.data});

  @override
  List<Object?> get props => [form, data];
}

class FormSubmissionFailedState extends FormErrorState implements EditableState {
  const FormSubmissionFailedState(super.form);
}
