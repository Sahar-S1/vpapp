import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/announcements.dart';

class AppDrawer extends StatelessWidget {
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
              color: Theme.of(context).primaryColor,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Drawer',
                style: theme.textTheme.displayMedium,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Announcement',
              style: theme.textTheme.titleLarge,
            ),
            onTap: () {
              context.push(AnnouncementsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
