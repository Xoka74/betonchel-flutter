import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:betonchel_manager/utils/extensions/datetime_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class AppDateTimeField extends StatelessWidget {
  final ValueNotifier<DateTime?> controller;
  final String? labelText;

  const AppDateTimeField({
    super.key,
    required this.controller,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    final borderRadius = BorderRadius.circular(12.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(labelText!),
          ),
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return InkWell(
              borderRadius: borderRadius,
              onTap: () => _showPicker(context),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('${value!.toLocaleDateFormat(strings)} ${DateFormat('HH:mm').format(value)}'),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> _showPicker(BuildContext context) async {
    final value = await showOmniDateTimePicker(
      context: context,
      initialDate: controller.value,
      is24HourMode: true,
      isShowSeconds: false,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      barrierDismissible: true,
    );

    if (value == null) {
      return;
    }

    controller.value = value;
  }
}
