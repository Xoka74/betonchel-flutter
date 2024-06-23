import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/firebase_options.dart';
import 'package:betonchel_manager/presentation/betonchel_manager_app.dart';
import 'package:betonchel_manager/presentation/bloc_providers.dart';
import 'package:firebase_core/firebase_core.dart';
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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseMessaging.instance.subscribeToTopic(Topics.applications);
  // print(await FirebaseMessaging.instance.getToken());

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  configureDependencies();
}
