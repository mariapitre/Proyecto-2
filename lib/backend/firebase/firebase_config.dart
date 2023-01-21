import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB3BdKRvi7mDC8ph3Nd57E9gynQfHJhGVg",
            authDomain: "neutrolab-98b2d.firebaseapp.com",
            projectId: "neutrolab-98b2d",
            storageBucket: "neutrolab-98b2d.appspot.com",
            messagingSenderId: "999392625787",
            appId: "1:999392625787:web:9ecec370153530c475cede",
            measurementId: "G-F9918K762X"));
  } else {
    await Firebase.initializeApp();
  }
}
