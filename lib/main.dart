import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swe_reler/src/screens/landing_page/landing_page.dart';
import 'package:swe_reler/src/screens/login_screen.dart';
import 'package:swe_reler/src/theme.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReLer',
      theme: theme,
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
