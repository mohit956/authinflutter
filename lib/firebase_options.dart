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
    apiKey: 'AIzaSyAaHN64-hPUgHekFYyVnMnaDTj_JWMfPew',
    appId: '1:96455154472:web:c055939ef583ca36b58e1d',
    messagingSenderId: '96455154472',
    projectId: 'learnauth-45183',
    authDomain: 'learnauth-45183.firebaseapp.com',
    storageBucket: 'learnauth-45183.appspot.com',
    measurementId: 'G-BH02DLZ7XT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaYIVlRu7Q-bd_GF35rSoKN_7v1QL5cuU',
    appId: '1:96455154472:android:3c0bd209a3ecd5f9b58e1d',
    messagingSenderId: '96455154472',
    projectId: 'learnauth-45183',
    storageBucket: 'learnauth-45183.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxNgaBc0ihUz7GhhTX4RvDB57Q4DE0ex0',
    appId: '1:96455154472:ios:306c7e72a0e0caaab58e1d',
    messagingSenderId: '96455154472',
    projectId: 'learnauth-45183',
    storageBucket: 'learnauth-45183.appspot.com',
    iosBundleId: 'com.example.authinflutter',
  );
}