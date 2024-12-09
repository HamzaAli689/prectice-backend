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
    apiKey: 'AIzaSyDGzSmBjxv7VEqhkMR9byOXHXcCyf7MT-g',
    appId: '1:955995175338:web:48204678c4b111dbacd3d3',
    messagingSenderId: '955995175338',
    projectId: 'loginapps-6cd94',
    authDomain: 'loginapps-6cd94.firebaseapp.com',
    storageBucket: 'loginapps-6cd94.appspot.com',
    measurementId: 'G-XJ5126D1X0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0R2RWaXwfZJSM6TnDFztQtcmXpbsaGMU',
    appId: '1:955995175338:android:a078f64c5e3fa9e6acd3d3',
    messagingSenderId: '955995175338',
    projectId: 'loginapps-6cd94',
    storageBucket: 'loginapps-6cd94.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCn8MUuyERmwOAUA6f-R8xyOTcldaywqtY',
    appId: '1:955995175338:ios:498c2c91b2860b41acd3d3',
    messagingSenderId: '955995175338',
    projectId: 'loginapps-6cd94',
    storageBucket: 'loginapps-6cd94.appspot.com',
    iosBundleId: 'com.DisputeResolverAI.app.disputeResolverAi',
  );
}
