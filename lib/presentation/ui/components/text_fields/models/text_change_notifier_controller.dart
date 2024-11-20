import 'package:flutter/material.dart';

class TextChangeNotifierController extends TextEditingController {
  final _textChangeNotifier = ValueNotifier<String>('');

  TextChangeNotifierController() {
    addListener(_updateTextValue);
  }

  void _updateTextValue() {
    _textChangeNotifier.value = text;
  }

  void addTextChangeListener(VoidCallback listener) {
    _textChangeNotifier.addListener(listener);
  }

  void removeTextChangeListener(VoidCallback listener) {
    _textChangeNotifier.removeListener(listener);
  }

  @override
  void dispose() {
    removeListener(_updateTextValue);
    _textChangeNotifier.dispose();
    super.dispose();
  }
}
