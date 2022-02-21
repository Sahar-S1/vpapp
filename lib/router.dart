import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/providers.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => HomePage.routeName,
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AnnouncementsPage.routeName,
      builder: (context, state) => const AnnouncementsPage(),
    ),
    GoRoute(
      path: AnnouncementPage.routeName,
      builder: (context, state) => AnnouncementPage(
        id: int.parse(state.params['id'] ?? '-1'),
      ),
    ),
  ],
  navigatorBuilder: (context, state, child) => AppProviders(child: child),
  debugLogDiagnostics: true,
);
