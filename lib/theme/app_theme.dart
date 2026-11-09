import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData light() => _build(Brightness.light);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        centerTitle: false
      ),
    );
  }
}