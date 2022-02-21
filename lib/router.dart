import 'package:flutter/material.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/home.dart';

class AppRouter {
  static const String? initialRoute = '/';

  static final Map<String, Widget Function(BuildContext)> routes = {
    HomePage.routeName: (context) => const HomePage(),
    AnnouncementsPage.routeName: (context) => const AnnouncementsPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
