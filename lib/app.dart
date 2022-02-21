import 'package:flutter/material.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/providers.dart';
import 'package:vpapp/router.dart';
import 'package:vpapp/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        // Title
        title: AppConfig.title,
        // Theme
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: AppTheme.themeMode,
        // Routes
        routes: AppRouter.routes,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.initialRoute,
      ),
    );
  }
}
