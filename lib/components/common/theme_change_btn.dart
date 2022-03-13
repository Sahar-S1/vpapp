import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/theme.dart';

class ThemeChangeBtn extends StatelessWidget {
  const ThemeChangeBtn({Key? key}) : super(key: key);

  IconData _getIcon() {
    var themeMode = AppTheme.getThemeMode();
    return themeMode == ThemeMode.system
        ? Icons.brightness_auto
        : themeMode == ThemeMode.light
            ? Icons.brightness_high
            : Icons.brightness_4;
  }

  void _changeTheme() {
    var themeMode = AppTheme.getThemeMode();
    AppTheme.setThemeMode(
      themeMode == ThemeMode.system
          ? ThemeMode.light
          : themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.system,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(AppTheme.box).listenable(),
      builder: (context, box, widget) => RawMaterialButton(
        shape: const CircleBorder(),
        child: Icon(
          _getIcon(),
          color: Theme.of(context).primaryTextTheme.button?.color,
        ),
        onPressed: () => _changeTheme(),
      ),
    );
  }
}
