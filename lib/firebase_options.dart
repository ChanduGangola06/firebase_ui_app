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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuL5DCxvOhbHw5K0jR1F-7In1h1g7-JrQ',
    appId: '1:355416358877:android:b76e6cf52d12c6634c4034',
    messagingSenderId: '355416358877',
    projectId: 'fir-series-65445',
    storageBucket: 'fir-series-65445.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpJ3Ysb2yzO9jpynohYLu0nXm1B0ogbVQ',
    appId: '1:355416358877:ios:b42b1491c7c151a54c4034',
    messagingSenderId: '355416358877',
    projectId: 'fir-series-65445',
    storageBucket: 'fir-series-65445.appspot.com',
    androidClientId: '355416358877-2gbadrc90t7svrb1ntu4881cdocbglbd.apps.googleusercontent.com',
    iosClientId: '355416358877-noj2i3s9a450936utd7rcu07gdf193n4.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseUiApp',
  );
}