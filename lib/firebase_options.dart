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
    apiKey: 'AIzaSyAYVCYKlDrDEWwmt6XDwMesHNwBEykw2x8',
    appId: '1:261865902481:web:5cea7387dbca3645284a30',
    messagingSenderId: '261865902481',
    projectId: 'agrical-scan-appl-project',
    authDomain: 'agrical-scan-appl-project.firebaseapp.com',
    storageBucket: 'agrical-scan-appl-project.appspot.com',
    measurementId: 'G-8F68SFMS3G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqUpvGGy0Cjumw8OVbRrUTzM2NCTiDU8o',
    appId: '1:261865902481:android:e9e80dc818b1a658284a30',
    messagingSenderId: '261865902481',
    projectId: 'agrical-scan-appl-project',
    storageBucket: 'agrical-scan-appl-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXZbTfdbMTU8Wvtt4YKpMXkhy4TZijfv8',
    appId: '1:261865902481:ios:e5f1444142a6bc94284a30',
    messagingSenderId: '261865902481',
    projectId: 'agrical-scan-appl-project',
    storageBucket: 'agrical-scan-appl-project.appspot.com',
    iosBundleId: 'com.example.finalProject',
  );
}
