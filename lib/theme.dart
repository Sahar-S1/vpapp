import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppTheme {
  static const String box = 'vp_apptheme';
  static const String key = 'vp_apptheme_thememode';

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

  static ThemeMode getThemeMode() =>
      Hive.box(box).get(key, defaultValue: ThemeMode.system);

  static void setThemeMode(ThemeMode themeMode) =>
      Hive.box(box).put(key, themeMode);
}

class ThemeModeAdapter extends TypeAdapter<ThemeMode> {
  @override
  int get typeId => 0;

  @override
  ThemeMode read(BinaryReader reader) {
    var val = reader.read();
    return val == 'system'
        ? ThemeMode.system
        : val == 'light'
            ? ThemeMode.light
            : ThemeMode.dark;
  }

  @override
  void write(BinaryWriter writer, ThemeMode obj) {
    writer.write(
      obj == ThemeMode.system
          ? 'system'
          : obj == ThemeMode.light
              ? 'light'
              : 'dark',
    );
  }
}
