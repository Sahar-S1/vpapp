import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/router.dart';
import 'package:vpapp/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(AppTheme.box).listenable(),
      builder: (context, box, widget) => MaterialApp.router(
        // Title
        title: AppConfig.title,
        // Theme
        theme: AppTheme.getTheme(),
        darkTheme: AppTheme.getDarkTheme(),
        themeMode: AppTheme.getThemeMode(),
        // Router
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
