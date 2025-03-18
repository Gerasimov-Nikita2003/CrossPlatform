import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myaplication/di/di.dart';
import 'package:myaplication/news_brief.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyBYmkt-JMJzG19ZFMNZHNpsaSOgM6-E9pk',
            appId: '1:764556583689:web:66a90aca4ae64e7a9069d8',
            messagingSenderId: '764556583689',
            projectId: 'flutter-1819c',
            authDomain: 'flutter-1819c.firebaseapp.com',
            storageBucket: 'flutter-1819c.firebasestorage.app',
            measurementId: 'G-M30H5MPZ92'));
  } else {
    await Firebase.initializeApp();
  }

  setupLocator();
  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
      );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApk());
}
