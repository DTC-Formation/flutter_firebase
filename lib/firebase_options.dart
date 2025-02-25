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
    apiKey: 'AIzaSyDEEkn4KSeueRF8r35OTCzRQi86qQhGPpU',
    appId: '1:211248812283:web:5f7b1dc1b240de6affe05e',
    messagingSenderId: '211248812283',
    projectId: 'dtc-firebase',
    authDomain: 'dtc-firebase.firebaseapp.com',
    storageBucket: 'dtc-firebase.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuNpMPVX5eEa6LRneZKUTc2AG2ATKSX_o',
    appId: '1:211248812283:android:bb0927141b38bcebffe05e',
    messagingSenderId: '211248812283',
    projectId: 'dtc-firebase',
    storageBucket: 'dtc-firebase.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3N96RMP1lnTWbSqTan1vNPm8j2_SXYWc',
    appId: '1:211248812283:ios:14ede61d1f6f306fffe05e',
    messagingSenderId: '211248812283',
    projectId: 'dtc-firebase',
    storageBucket: 'dtc-firebase.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3N96RMP1lnTWbSqTan1vNPm8j2_SXYWc',
    appId: '1:211248812283:ios:14ede61d1f6f306fffe05e',
    messagingSenderId: '211248812283',
    projectId: 'dtc-firebase',
    storageBucket: 'dtc-firebase.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEEkn4KSeueRF8r35OTCzRQi86qQhGPpU',
    appId: '1:211248812283:web:74d7713ee4d8118fffe05e',
    messagingSenderId: '211248812283',
    projectId: 'dtc-firebase',
    authDomain: 'dtc-firebase.firebaseapp.com',
    storageBucket: 'dtc-firebase.firebasestorage.app',
  );

}