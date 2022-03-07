import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/blogs.dart';
import 'package:vpapp/pages/clubs.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/pages/info_list.dart';

class Link {
  final String name;
  final String link;

  const Link({required this.name, required this.link});
}

class AppDrawer extends StatelessWidget {
  static const List<Link> _links = [
    Link(
      name: 'Home',
      link: HomePage.routeName,
    ),
    Link(
      name: 'Announcments',
      link: AnnouncementsPage.routeName,
    ),
    Link(
      name: 'Clubs',
      link: ClubsPage.routeName,
    ),
    Link(
      name: 'Blogs',
      link: BlogsPage.routeName,
    ),
    Link(
      name: 'Info',
      link: InfoListPage.routeName,
    ),
  ];

  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
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
          for (var link in _links)
            ListTile(
              title: Text(
                link.name,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
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
        ],
      ),
    );
  }
}
