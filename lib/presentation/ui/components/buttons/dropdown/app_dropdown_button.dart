import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppDropdownButton<T> extends StatelessWidget {
  final ValueNotifier<T> controller;
  final List<DropdownMenuItem<T>>? items;
  final String? hint;
  final bool isExpanded;

  const AppDropdownButton({
    super.key,
    required this.controller,
    this.items,
    this.hint,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        final colors = context.theme;

        return Column(
          children: [
            DropdownButton<T>(
              items: items,
              value: value,
              isExpanded: isExpanded,
              focusColor: colors.canvasColor,
              padding: const EdgeInsets.all(12),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              hint: hint != null ? Text(hint!) : null,
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                controller.value = value;
              },
            ),
          ],
        );
      },
    );
  }
}
