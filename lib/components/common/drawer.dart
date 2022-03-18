import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/components/common/theme_change_btn.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/blogs.dart';
import 'package:vpapp/pages/clubs.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/pages/info_list.dart';
import 'package:vpapp/pages/login.dart';

class Link {
  final String name;
  final String link;
  final IconData icon;

  const Link({required this.name, required this.link, required this.icon});
}

class AppDrawer extends StatelessWidget {
  static const List<Link> _links = [
    Link(
      name: 'Home',
      link: HomePage.routeName,
      icon: Icons.home,
    ),
    Link(
      name: 'Clubs',
      link: ClubsPage.routeName,
      icon: Icons.group,
    ),
    Link(
      name: 'Blogs',
      link: BlogsPage.routeName,
      icon: Icons.library_books,
    ),
    Link(
      name: 'Announcements',
      link: AnnouncementsPage.routeName,
      icon: Icons.campaign,
    ),
    Link(
      name: 'About College',
      link: InfoListPage.routeName,
      icon: Icons.info,
    ),
    Link(
      name: 'Login',
      link: LoginPage.routeName,
      icon: Icons.login,
    ),
  ];

  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: AppConfig.logoUrl,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ),
              const Positioned(
                top: 12,
                right: -12,
                child: ThemeChangeBtn(),
              ),
            ],
          ),
          for (var link in _links)
            ListTile(
              leading: Icon(link.icon),
              title: Text(
                link.name,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
              onTap: () => context.goNamed(link.link),
            ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              child: CircleAvatar(
                backgroundColor: theme.primaryColor,
                child: const Icon(Icons.arrow_back),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          // const Spacer(),
          // const Divider(),
          // Row(
          //   children: [
          //     RawMaterialButton(
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: Theme.of(context).primaryTextTheme.button?.color,
          //       ),
          //       onPressed: () => Navigator.of(context).pop(),
          //     ),
          //     const Spacer(),
          //     const ThemeChangeBtn(),
          //   ],
          // ),
        ],
      ),
    );
  }
}
