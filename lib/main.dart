import 'package:csapp/screens/home.dart';
import 'package:csapp/screens/login.dart';
import 'package:csapp/screens/search_result.dart';
import 'package:csapp/screens/single_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(
      child: MaterialApp(
          initialRoute:
              FirebaseAuth.instance.currentUser == null ? "/login" : "/home",
          routes: {
        "/home": (context) => HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/report": (context) => const SingleReportScreen(),
        "/search_result": (context) => SearchResultScreen()
      })));
}
