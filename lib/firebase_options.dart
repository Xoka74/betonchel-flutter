// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDB-xplRkuga9Z98FVi6PLKJSkge8JOacE',
    appId: '1:172629619433:web:b258068d5a3c029f90f678',
    messagingSenderId: '172629619433',
    projectId: 'betonchel-manager',
    authDomain: 'betonchel-manager.firebaseapp.com',
    storageBucket: 'betonchel-manager.appspot.com',
    measurementId: 'G-HSGMK03B45',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDirOJ2u9S_Vi91_2Y9wwxFlU5hxJD3bmo',
    appId: '1:172629619433:android:80afd6842fcd64b590f678',
    messagingSenderId: '172629619433',
    projectId: 'betonchel-manager',
    storageBucket: 'betonchel-manager.appspot.com',
  );
}
