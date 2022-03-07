import 'package:flutter/material.dart';
import 'package:vpapp/components/clubs/clubs_list.dart';
import 'package:vpapp/components/common/page_template.dart';

class ClubsPage extends StatelessWidget {
  static const routeName = 'clubs';

  const ClubsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageTemplate(
        header: 'Clubs',
        child: ClubsList(),
      ),
    );
  }
}
