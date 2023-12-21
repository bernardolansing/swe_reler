import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF718E76);
const _secondaryColor = Color(0xFF4F493D);
const _backgroundColor = Color(0xFFE1DBC9);
const _errorColor = Color(0xFFBB2020);
const _surfaceColor = Color(0xFFD6CAA7);

final theme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: _primaryColor,
      onPrimary: Colors.white,
      secondary: _secondaryColor,
      onSecondary: Colors.white,
      background: _backgroundColor,
      onBackground: Colors.black,
      error: _errorColor,
      onError: Colors.white,
      surface: _surfaceColor,
      onSurface: Colors.black54
  ),
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72,
          fontFamily: 'Teko',
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),
      bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black
      )
  ),
  scaffoldBackgroundColor: _backgroundColor,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 24)
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 24),
      )
  ),
);