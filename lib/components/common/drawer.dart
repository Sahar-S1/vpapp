import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcements.dart';
import 'package:vpapp/pages/home.dart';

class Link {
  final String name;
  final String link;
  final bool push;

  const Link({required this.name, required this.link, this.push = true});
}

class AppDrawer extends StatelessWidget {
  static const List<Link> _links = [
    Link(
      name: 'Home',
      link: HomePage.routeName,
      push: false,
    ),
    Link(
      name: 'Announcments',
      link: AnnouncementsPage.routeName,
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
              child: Image.network(
                'https://cms.vp.appsinfra.in/assets/1df44888-40db-41fe-a4f9-b42062954dd4',
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
              onTap: () {
                if (link.push) {
                  context.push(link.link);
                } else {
                  context.go(link.link);
                }
              },
            ),
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
