import 'package:auto_route/annotations.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Text(strings.settings);
  }
}
