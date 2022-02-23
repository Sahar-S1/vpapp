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
            leading: const Icon(Icons.announcement),
            title: Text(
              'Announcement',
              style: theme.textTheme.titleLarge,
            ),
            trailing: const Icon(Icons.arrow_right_alt),
            onTap: () {
              context.push(AnnouncementsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
