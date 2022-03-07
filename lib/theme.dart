import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? getTheme({bool isInitial = false}) {
    ThemeData? _initialTheme = isInitial ? null : getTheme(isInitial: true);
    return ThemeData(
      colorSchemeSeed: Colors.green,
      fontFamily: 'OpenSans',
      appBarTheme: _initialTheme?.appBarTheme.copyWith(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: _initialTheme.primaryColor,
      ),
    ).copyWith(
      colorScheme: _initialTheme?.colorScheme.copyWith(
        primaryContainer: Colors.green,
      ),
    );
  }

  static ThemeData? getDarkTheme({bool isInitial = false}) {
    ThemeData? _initialTheme = isInitial ? null : getDarkTheme(isInitial: true);
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.green,
      fontFamily: 'OpenSans',
      appBarTheme: _initialTheme?.appBarTheme.copyWith(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeMode? getThemeMode() => ThemeMode.system;
}
