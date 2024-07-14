import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/firebase_options.dart';
import 'package:betonchel_manager/presentation/betonchel_manager_app.dart';
import 'package:betonchel_manager/presentation/bloc_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
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

  await _setupFirebase();

  configureDependencies();
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _setupCrashlytics();
  await _setupMessaging();
}

Future<void> _setupMessaging() async {
  // await FirebaseMessaging.instance.subscribeToTopic(Topics.applications);
  // print(await FirebaseMessaging.instance.getToken());

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _setupCrashlytics() async {
  if (!kIsWeb) {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
  }
}
