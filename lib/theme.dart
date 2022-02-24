import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData? theme = ThemeData(
    colorSchemeSeed: Colors.green,
    fontFamily: 'OpenSans',
  );

  static final ThemeData? darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.green,
    fontFamily: 'OpenSans',
  );

  static const ThemeMode? themeMode = ThemeMode.system;
}
