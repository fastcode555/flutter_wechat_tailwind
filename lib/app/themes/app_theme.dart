import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primaryColor: const Color(0xFF07C160),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEDEDED),
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF07C160),
          primary: const Color(0xFF07C160),
        ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF07C160),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF191919),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      );
} 