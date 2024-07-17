import 'package:betonchel_manager/di/injection.dart';
import 'package:betonchel_manager/firebase_options.dart';
import 'package:betonchel_manager/presentation/betonchel_manager_app.dart';
import 'package:betonchel_manager/presentation/bloc_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  await _setupOrientation();

  await _setupFirebase();

  configureDependencies();
}

Future<void> _setupOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _setupCrashlytics();
  await _setupMessaging();
}

Future<void> _setupMessaging() async {
  await FirebaseMessaging.instance.requestPermission(provisional: true);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message');
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
