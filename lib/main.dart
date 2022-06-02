import 'package:csapp/screens/home.dart';
import 'package:csapp/screens/login.dart';
import 'package:csapp/screens/single_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? "/login" : "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/report": (context) => const SingleReportScreen(),
      }));
}
