import 'package:flutter/material.dart';

import 'package:vpapp/components/common/drawer.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/config.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: AppConfig.title,
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: const AppDrawer(),
        body: child,
      ),
      childBuilder: (sc) => Container(),
    );
  }
}
