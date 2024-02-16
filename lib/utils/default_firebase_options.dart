import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyAeQFX_vEeuJfuOoQCpkOiy5oT_Egp_BZ0",
      authDomain: "samriddhi-3rdsem.firebaseapp.com",
      projectId: "samriddhi-3rdsem",
      storageBucket: "samriddhi-3rdsem.appspot.com",
      messagingSenderId: "1000085793924",
      appId: "1:1000085793924:web:b2006a075b81d7631826d1"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAeQFX_vEeuJfuOoQCpkOiy5oT_Egp_BZ0",
      authDomain: "samriddhi-3rdsem.firebaseapp.com",
      projectId: "samriddhi-3rdsem",
      storageBucket: "samriddhi-3rdsem.appspot.com",
      messagingSenderId: "1000085793924",
      appId: "1:1000085793924:web:b2006a075b81d7631826d1"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyAeQFX_vEeuJfuOoQCpkOiy5oT_Egp_BZ0",
      authDomain: "samriddhi-3rdsem.firebaseapp.com",
      projectId: "samriddhi-3rdsem",
      storageBucket: "samriddhi-3rdsem.appspot.com",
      messagingSenderId: "1000085793924",
      appId: "1:1000085793924:web:b2006a075b81d7631826d1"
  );

}