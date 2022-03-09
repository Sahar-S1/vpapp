import 'package:flutter/material.dart';
import 'package:vpapp/components/announcements/announcements_list.dart';
import 'package:vpapp/components/common/page_template.dart';

class AnnouncementsPage extends StatelessWidget {
  static const routeName = 'announcements';

  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Announcements',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => AnnouncementsList(scrollController: sc),
    );
  }
}
