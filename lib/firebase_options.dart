import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHahziWAhCnfRZ-6qSO48pkRt8cu4ybnM',
    appId: '1:159727243846:android:afbeccac32c0e79893b047',
    messagingSenderId: '159727243846',
    projectId: 'music-d4b5d',
    storageBucket: 'music-d4b5d.firebasestorage.app',
  );
}
