import 'package:flutter/material.dart';
import 'package:vpapp/components/announcements/announcements_list.dart';
import 'package:vpapp/components/common/page_template.dart';

class AnnouncementsPage extends StatelessWidget {
  static const routeName = 'announcements';

  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageTemplate(
        header: 'Announcements',
        child: AnnouncementsList(),
      ),
    );
  }
}
