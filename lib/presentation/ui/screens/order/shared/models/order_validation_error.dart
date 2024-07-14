import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';

class OrderValidationError extends FormValidationError {
  final ValidationError? customerNameError;
  final ValidationError? contactDataError;
  final ValidationError? deliveryAddressError;
  final ValidationError? statusError;

  final ValidationError? concreteGradeError;

  final ValidationError? totalPriceError;
  final ValidationError? volumeError;

  const OrderValidationError({
    required this.customerNameError,
    required this.contactDataError,
    required this.deliveryAddressError,
    required this.statusError,
    required this.concreteGradeError,
    required this.totalPriceError,
    required this.volumeError,
  });

  @override
  List<Object?> get props => [
        customerNameError,
        contactDataError,
        deliveryAddressError,
        statusError,
        totalPriceError,
        volumeError,
      ];
}
