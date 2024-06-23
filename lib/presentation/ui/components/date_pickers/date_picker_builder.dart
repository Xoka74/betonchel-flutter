import 'package:betonchel_manager/presentation/ui/components/date_pickers/date_controller.dart';
import 'package:flutter/material.dart';

class DatePickerBuilder extends StatefulWidget {
  final DateController controller;
  final bool resetIfNotSelected;

  final Widget Function(DateTime?) builder;

  const DatePickerBuilder({
    super.key,
    required this.controller,
    this.resetIfNotSelected = false,
    required this.builder,
  });

  @override
  State<DatePickerBuilder> createState() => _DatePickerBuilderState();
}

class _DatePickerBuilderState extends State<DatePickerBuilder> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(18);

    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, value, child) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: _onDatePickerPressed,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: widget.builder(value),
          ),
        ),
      ),
    );
  }

  Future<void> _onDatePickerPressed() async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: widget.controller.minDate,
      lastDate: widget.controller.maxDate,
    );

    if (selectedDate == null && !widget.resetIfNotSelected) {
      return;
    }

    widget.controller.value = selectedDate;
  }
}
