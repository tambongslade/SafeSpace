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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDLcCLv0X2mnwhK3hprcKbY-iuTMlWYai0',
    appId: '1:728339376075:web:ba4ee91b00b3b62edd384e',
    messagingSenderId: '728339376075',
    projectId: 'safespace-7d56f',
    authDomain: 'safespace-7d56f.firebaseapp.com',
    storageBucket: 'safespace-7d56f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJXZJfYRSQ8LDW8_I4HA1MnHff4H-05x8',
    appId: '1:728339376075:android:930e5d7cf2c536e0dd384e',
    messagingSenderId: '728339376075',
    projectId: 'safespace-7d56f',
    storageBucket: 'safespace-7d56f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL4RWKbUSgzc9MxxXUbLkedSLTyCuUi_w',
    appId: '1:728339376075:ios:d9253342a0199523dd384e',
    messagingSenderId: '728339376075',
    projectId: 'safespace-7d56f',
    storageBucket: 'safespace-7d56f.appspot.com',
    iosBundleId: 'com.example.safespace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL4RWKbUSgzc9MxxXUbLkedSLTyCuUi_w',
    appId: '1:728339376075:ios:d9253342a0199523dd384e',
    messagingSenderId: '728339376075',
    projectId: 'safespace-7d56f',
    storageBucket: 'safespace-7d56f.appspot.com',
    iosBundleId: 'com.example.safespace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDLcCLv0X2mnwhK3hprcKbY-iuTMlWYai0',
    appId: '1:728339376075:web:b0a6cfa605b9f8f0dd384e',
    messagingSenderId: '728339376075',
    projectId: 'safespace-7d56f',
    authDomain: 'safespace-7d56f.firebaseapp.com',
    storageBucket: 'safespace-7d56f.appspot.com',
  );
}
