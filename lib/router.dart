import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/home.dart';

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
      builder: (context, state) {
        String? id = state.params['id'];

        if (id == null || int.tryParse(id) == null) {
          return const AnnouncementsPage();
        }

        return AnnouncementPage(id: int.parse(id));
      },
    ),
  ],
  debugLogDiagnostics: true,
);
