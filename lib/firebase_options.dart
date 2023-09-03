// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyA_z1QRL1mGichrG1iOtcCNoGO55Ox_hEk',
    appId: '1:679730694851:web:fc49f8cf8e35fbcb5d7076',
    messagingSenderId: '679730694851',
    projectId: 'evaly-bde5b',
    authDomain: 'evaly-bde5b.firebaseapp.com',
    storageBucket: 'evaly-bde5b.appspot.com',
    measurementId: 'G-1KR72TF96D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiTmMXesjEEfElo5wEHVEj8NtMX8wabsQ',
    appId: '1:679730694851:android:03a6080c9fdc74a95d7076',
    messagingSenderId: '679730694851',
    projectId: 'evaly-bde5b',
    storageBucket: 'evaly-bde5b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAx9q-bsn3Tv8kxKEvEI1CoWORVjRRtRRg',
    appId: '1:679730694851:ios:7e47ce662218abbd5d7076',
    messagingSenderId: '679730694851',
    projectId: 'evaly-bde5b',
    storageBucket: 'evaly-bde5b.appspot.com',
    iosClientId: '679730694851-chpqov6lmk4sljvav5fs9ic3kspkojtj.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAx9q-bsn3Tv8kxKEvEI1CoWORVjRRtRRg',
    appId: '1:679730694851:ios:d879275501347d9f5d7076',
    messagingSenderId: '679730694851',
    projectId: 'evaly-bde5b',
    storageBucket: 'evaly-bde5b.appspot.com',
    iosClientId: '679730694851-i9jrrekd1i9d1cmko0erjp0rskcbcqcn.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}