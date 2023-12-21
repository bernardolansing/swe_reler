import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swe_reler/src/screens/landing_page/landing_page.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReLer',
      theme: _theme,
      home: const LandingPage(),
    );
  }
}

final _theme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF718E76),
        onPrimary: Colors.white,
        secondary: Color(0xFF4F493D),
        onSecondary: Colors.white,
        background: Color(0xFFE1DBC9),
        onBackground: Colors.black,
        error: Color(0xFFBB2020),
        onError: Colors.white,
        surface: Color(0xFFD6CAA7),
        onSurface: Colors.black54
    ),
    scaffoldBackgroundColor: const Color(0xFFE1DBC9),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 24)
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF4F493D),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 24),
      )
    ),
);
