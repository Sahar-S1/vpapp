import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/clubs.dart';
import 'package:vpapp/pages/home.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    // Initial Page
    GoRoute(
      path: '/',
      redirect: (_) => HomePage.routeName,
    ),

    // Home Page
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),

    // Announcments Pages
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

    // Clubs Pages
    GoRoute(
      path: ClubsPage.routeName,
      builder: (context, state) => const ClubsPage(),
    ),
  ],
  debugLogDiagnostics: true,
);
