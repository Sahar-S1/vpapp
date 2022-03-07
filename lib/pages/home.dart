import 'package:flutter/material.dart';

import 'package:vpapp/components/common/drawer.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/config.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: PageTemplate(
        header: AppConfig.title,
        child: Container(),
      ),
    );
  }
}
