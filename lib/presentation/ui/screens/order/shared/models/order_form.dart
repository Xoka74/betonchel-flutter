import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/domain/models/order/order.dart';
import 'package:betonchel_manager/domain/models/order/order_data.dart';
import 'package:betonchel_manager/domain/models/order/order_status.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/app_form.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/form_validation_error.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/form_screen/models/form/validation_error.dart';
import 'package:betonchel_manager/presentation/ui/screens/order/shared/models/order_validation_error.dart';
import 'package:betonchel_manager/utils/validation_utils.dart';
import 'package:flutter/cupertino.dart';

class OrderForm extends AppForm {
  final customerName = TextEditingController();
  final contactData = TextEditingController();

  final deliveryDateTime = ValueNotifier<DateTime?>(null);

  final status = ValueNotifier<OrderStatus?>(null);
  final totalPrice = TextEditingController();
  final volume = TextEditingController();
  final concreteGrade = ValueNotifier<ConcreteGrade?>(null);
  final description = TextEditingController();
  final deliveryAddress = TextEditingController();
  final allConcreteGrades = ValueNotifier<List<ConcreteGrade>>([]);

  void setData(Order order) {
    customerName.text = order.customerName;
    contactData.text = order.contactData;
    deliveryDateTime.value = order.deliveryDateTime;
    status.value = order.status;
    totalPrice.text = order.totalPrice.toString();
    volume.text = order.volume.toString();
    concreteGrade.value = order.concreteGrade;
    description.text = order.description;
    deliveryAddress.text = order.deliveryAddress.toString();
  }

  OrderData getOrderData() => OrderData(
        customerName: customerName.text,
        contactData: contactData.text,
        deliveryDate: deliveryDateTime.value ?? DateTime.now(),
        totalPrice: double.parse(totalPrice.text),
        volume: double.parse(volume.text),
        concreteGradeId: concreteGrade.value!.id,
        status: status.value!,
        deliveryAddress: deliveryAddress.text,
        description: description.text,
      );

  @override
  FormValidationError? validate() {
    final customerNameError = customerName.text.isEmpty ? ValidationError.required : null;
    final contactDataError = contactData.text.isEmpty ? ValidationError.required : null;
    final deliveryAddressError = deliveryAddress.text.isEmpty ? ValidationError.required : null;
    final statusError = status.value == null ? ValidationError.required : null;

    final concreteGradeError = concreteGrade.value == null ? ValidationError.required : null;

    final totalPriceError = ValidationUtils.validateDouble(totalPrice.text);
    final volumeError = ValidationUtils.validateDouble(volume.text);

    final errors = [
      customerNameError,
      contactDataError,
      deliveryAddressError,
      statusError,
      concreteGradeError,
      totalPriceError,
      volumeError,
    ];

    if (errors.any((err) => err != null)) {
      return OrderValidationError(
        contactDataError: contactDataError,
        customerNameError: customerNameError,
        deliveryAddressError: deliveryAddressError,
        statusError: statusError,
        concreteGradeError: concreteGradeError,
        totalPriceError: totalPriceError,
        volumeError: volumeError,
      );
    }

    return null;
  }

  @override
  void addListener(VoidCallback listener) {
    customerName.addListener(listener);
    deliveryDateTime.addListener(listener);
    status.addListener(listener);
    totalPrice.addListener(listener);
    volume.addListener(listener);
    concreteGrade.addListener(listener);
    description.addListener(listener);
    deliveryAddress.addListener(listener);
    allConcreteGrades.addListener(listener);

    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    customerName.removeListener(listener);
    deliveryDateTime.removeListener(listener);
    status.removeListener(listener);
    totalPrice.removeListener(listener);
    volume.removeListener(listener);
    concreteGrade.removeListener(listener);
    description.removeListener(listener);
    deliveryAddress.removeListener(listener);
    allConcreteGrades.removeListener(listener);

    super.removeListener(listener);
  }

  @override
  void dispose() {
    customerName.dispose();
    deliveryDateTime.dispose();
    status.dispose();
    totalPrice.dispose();
    volume.dispose();
    concreteGrade.dispose();
    description.dispose();
    deliveryAddress.dispose();
    allConcreteGrades.dispose();

    super.dispose();
  }
}
