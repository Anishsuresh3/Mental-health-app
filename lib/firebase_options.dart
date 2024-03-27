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
    apiKey: 'AIzaSyBeMwyf4inAcKF2EJvKWVPJLkGMtxKVzCk',
    appId: '1:12182847229:web:41f143f8f9244ac990c894',
    messagingSenderId: '12182847229',
    projectId: 'mental-f11e7',
    authDomain: 'mental-f11e7.firebaseapp.com',
    storageBucket: 'mental-f11e7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwKAvUXwjSqOCpbs7fe6Rm0KduYghvXj0',
    appId: '1:12182847229:android:54d9e753c587a79990c894',
    messagingSenderId: '12182847229',
    projectId: 'mental-f11e7',
    storageBucket: 'mental-f11e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCL72qEI4H7UQu0A-CBFPgzMYeyOrHnchA',
    appId: '1:12182847229:ios:bfbb2781905f92d390c894',
    messagingSenderId: '12182847229',
    projectId: 'mental-f11e7',
    storageBucket: 'mental-f11e7.appspot.com',
    iosBundleId: 'com.example.mental',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCL72qEI4H7UQu0A-CBFPgzMYeyOrHnchA',
    appId: '1:12182847229:ios:6e945226ce467fca90c894',
    messagingSenderId: '12182847229',
    projectId: 'mental-f11e7',
    storageBucket: 'mental-f11e7.appspot.com',
    iosBundleId: 'com.example.mental.RunnerTests',
  );
}