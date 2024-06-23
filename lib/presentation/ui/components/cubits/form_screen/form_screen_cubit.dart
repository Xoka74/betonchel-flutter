import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/form_screen_state.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/app_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FormScreenCubit<T extends AppForm> extends Cubit<FormScreenState> {
  T form;

  FormScreenCubit(this.form) : super(FormEditingState(form)) {
    prepareData();
  }

  /// Prepare your data for form here
  @protected
  Future<void> prepareData() async {}

  /// Send your form to the server here
  Future<void> sendForm();

  Future<void> submitForm() async {
    form.removeListener(_formListener);
    if (validate()) {
      emit(FormSubmittingState(form));
      await sendForm();
    } else {
      form.addListener(_formListener);
    }
  }

  bool validate() {
    final validationError = form.validate();

    emit(validationError == null
        ? FormEditingState(form)
        : FormValidationFailedState(
            form,
            validationError,
          ));

    return validationError == null;
  }

  void _formListener() {
    validate();
  }

  @override
  Future<void> close() {
    form.dispose();

    return super.close();
  }
}
