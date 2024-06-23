import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:flutter/material.dart';

/// This class represents your form.
/// Usually it contains a set of controllers and validation logic for them
///  If you dont want to subscribe to changes you can leave [AddListener] and [RemoveListener] empty
abstract class AppForm extends ChangeNotifier {
  /// Validate your fields here
  /// If form is valid you should return null
  FormValidationError? validate();

  /// Subscribe to your controllers here
  @override
  void addListener(VoidCallback listener);

  /// Unsubscribe from your controllers here
  @override
  void removeListener(VoidCallback listener);

  /// Dispose of your controllers here
  @override
  void dispose();
}
