import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/blog.dart';
import 'package:vpapp/pages/blogs.dart';
import 'package:vpapp/pages/clubs.dart';
import 'package:vpapp/pages/department.dart';
import 'package:vpapp/pages/department_faculty.dart';
import 'package:vpapp/pages/department_info.dart';
import 'package:vpapp/pages/depearment_courses.dart';
import 'package:vpapp/pages/depearment_semesters.dart';
import 'package:vpapp/pages/depearment_years.dart';
import 'package:vpapp/pages/discussion.dart';
import 'package:vpapp/pages/discussions.dart';
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
              name: DepartmentInfoPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return HomePage();
                }

                return DepartmentInfoPage(id: int.parse(id));
              },
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
              name: DepartmentYearsPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return HomePage();
                }

                return DepartmentYearsPage(id: int.parse(id));
              },
              routes: [
                GoRoute(
                  path: ':year',
                  name: DepartmentSemestersPage.routeName,
                  builder: (context, state) {
                    String? id = state.params['id'];
                    String? year = state.params['year'];

                    if (id == null ||
                        int.tryParse(id) == null ||
                        year == null ||
                        int.tryParse(year) == null) {
                      return HomePage();
                    }

                    return DepartmentSemestersPage(
                      id: int.parse(id),
                      year: int.parse(year),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: ':semester',
                      name: DepartmentCoursesPage.routeName,
                      builder: (context, state) {
                        String? id = state.params['id'];
                        String? year = state.params['year'];
                        String? semester = state.params['semester'];

                        if (id == null ||
                            int.tryParse(id) == null ||
                            year == null ||
                            int.tryParse(year) == null ||
                            semester == null ||
                            int.tryParse(semester) == null) {
                          return HomePage();
                        }

                        return DepartmentCoursesPage(
                          id: int.parse(id),
                          year: int.parse(year),
                          semester: int.parse(semester),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'discussions',
          name: DiscussionsPage.routeName,
          builder: (context, state) => const DiscussionsPage(),
          routes: [
            GoRoute(
              path: ':id',
              name: DiscussionPage.routeName,
              builder: (context, state) {
                String? id = state.params['id'];

                if (id == null || int.tryParse(id) == null) {
                  return const DiscussionsPage();
                }

                return DiscussionPage(id: int.parse(id));
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
