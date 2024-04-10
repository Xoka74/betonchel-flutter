import 'package:flutter/cupertino.dart';

class DateController extends ValueNotifier<DateTime?> {
  final DateTime minDate;
  final DateTime maxDate;

  DateController(
    super.value, {
    required this.minDate,
    required this.maxDate,
  });

  @override
  set value(DateTime? newValue) {
    if (newValue == null) {
      super.value = newValue;

      return;
    }

    if (minDate.isBefore(newValue) && newValue.isBefore(maxDate)) {
      super.value = newValue;
    }
  }
}
