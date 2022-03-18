import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/blog.dart';
import 'package:vpapp/pages/blogs.dart';
import 'package:vpapp/pages/clubs.dart';
import 'package:vpapp/pages/department.dart';
import 'package:vpapp/pages/department_faculty.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/pages/info.dart';
import 'package:vpapp/pages/info_list.dart';
import 'package:vpapp/pages/login.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.routeName,
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'login',
          name: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
        ),
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
          routes: [
            GoRoute(
              path: ':id',
              name: BlogPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return const BlogsPage();
                }

                return BlogPage(id: int.parse(id));
              },
            ),
          ],
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
        GoRoute(
          path: 'departments/:id',
          name: DepartmentPage.routeName,
          builder: (context, state) {
            String? id = state.params['id'];

            if (id == null || int.tryParse(id) == null) {
              return HomePage();
            }

            return DepartmentPage(id: int.parse(id));
          },
          routes: [
            GoRoute(
              path: 'info',
            ),
            GoRoute(
              path: 'faculty',
              name: DepartmentFacultyPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return HomePage();
                }

                return DepartmentFacultyPage(id: int.parse(id));
              },
            ),
            GoRoute(
              path: 'courses',
            ),
          ],
        ),
      ],
    ),
  ],
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: true,
);
