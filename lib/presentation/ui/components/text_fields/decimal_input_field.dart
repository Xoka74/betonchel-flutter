import 'package:betonchel_manager/presentation/ui/components/text_fields/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DecimalInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? errorText;
  final TextInputAction? textInputAction;

  const DecimalInputField({
    super.key,
    required this.controller,
    this.labelText,
    this.textInputAction,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: labelText,
      textInputAction: textInputAction,
      errorText: errorText,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        TextInputFormatter.withFunction(
          (oldValue, newValue) {
            final text = newValue.text;
            return text.isEmpty
                ? newValue
                : double.tryParse(text) == null
                    ? oldValue
                    : newValue;
          },
        ),
      ],
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
    );
  }
}
