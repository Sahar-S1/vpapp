import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/blogs.dart';
import 'package:vpapp/pages/clubs.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/pages/info.dart';
import 'package:vpapp/pages/info_list.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.routeName,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'announcements',
          name: AnnouncementsPage.routeName,
          builder: (context, state) => const AnnouncementsPage(),
          routes: [
            GoRoute(
              path: ':id',
              name: AnnouncementPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return const AnnouncementsPage();
                }

                return AnnouncementPage(id: int.parse(id));
              },
            ),
          ],
        ),
        GoRoute(
          path: 'clubs',
          name: ClubsPage.routeName,
          builder: (context, state) => const ClubsPage(),
        ),
        GoRoute(
          path: 'blogs',
          name: BlogsPage.routeName,
          builder: (context, state) => const BlogsPage(),
        ),
        GoRoute(
          path: 'info',
          name: InfoListPage.routeName,
          builder: (context, state) => const InfoListPage(),
          routes: [
            GoRoute(
              path: ':id',
              name: InfoPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return const InfoListPage();
                }

                return InfoPage(id: int.parse(id));
              },
            ),
          ],
        ),
      ],
    ),
  ],
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: true,
);
