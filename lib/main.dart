import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/presentation/betonchel_manager_app.dart';
import 'package:betonchel_manager/presentation/bloc_providers.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await _setup();

  runApp(
    const BlocProviders(
      child: BetonchelManagerApp(),
    ),
  );
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
}
