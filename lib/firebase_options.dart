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
    apiKey: 'AIzaSyADMCSCxKdqf3eFE-IhsxJwilumg8M4ioA',
    appId: '1:389537531779:web:cd2637a873a70ba04398b6',
    messagingSenderId: '389537531779',
    projectId: 'zresume-f819f',
    authDomain: 'zresume-f819f.firebaseapp.com',
    storageBucket: 'zresume-f819f.appspot.com',
    measurementId: 'G-GB2626GDXQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPOnRMe7cnqbK85mxcJodk5jdKpU8iLtE',
    appId: '1:389537531779:android:885018abcbfae7264398b6',
    messagingSenderId: '389537531779',
    projectId: 'zresume-f819f',
    storageBucket: 'zresume-f819f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBk-Es7AJAAF1S50XS2WdYwfjD5VqC-3BY',
    appId: '1:389537531779:ios:1efde4b0430b5be14398b6',
    messagingSenderId: '389537531779',
    projectId: 'zresume-f819f',
    storageBucket: 'zresume-f819f.appspot.com',
    iosBundleId: 'com.example.zresume',
  );

}