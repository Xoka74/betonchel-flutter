import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? errorText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Iterable<String>? autofillHints;
  final bool enableSuggestions;
  final bool autocorrect;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final String? labelText;
  final int? maxLines;

  const AppTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.errorText,
    this.textInputAction,
    this.onSubmitted,
    this.autofillHints,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
      ),
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      autocorrect: autocorrect,
      obscureText: obscureText,
      textInputAction: textInputAction,
      enableSuggestions: enableSuggestions,
    );
  }
}
