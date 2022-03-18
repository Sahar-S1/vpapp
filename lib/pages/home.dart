import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/components/auth/user_action.dart';

import 'package:vpapp/components/common/drawer.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/models/department.dart';
import 'package:vpapp/pages/department.dart';
import 'package:vpapp/pages/info_list.dart';
import 'package:vpapp/services/department.dart';

class HomePage extends StatefulWidget with GetItStatefulWidgetMixin {
  static const routeName = 'home';

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GetItStateMixin {
  List<Department> departments = [];

  @override
  void initState() {
    super.initState();
    get<DepartmentService>().getAll().then((values) {
      setState(() {
        departments.addAll(values);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: AppConfig.title,
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            UserAction(),
          ],
        ),
        drawer: const AppDrawer(),
        body: child,
      ),
      childBuilder: (sc) => SingleChildScrollView(
        controller: sc,
        child: Column(
          children: [
            InkWell(
              onTap: () => context.goNamed(InfoListPage.routeName),
              child: const TextIconCard(
                text: 'About College',
                iconUrl:
                    '${AppConfig.directusAssetsEndpoint}/e22f1a67-acca-4c06-9872-b409440a1440.png',
              ),
            ),
            ...departments
                .map(
                  (department) => InkWell(
                    onTap: () => context.goNamed(
                      DepartmentPage.routeName,
                      params: {
                        'id': department.id.toString(),
                      },
                    ),
                    child: TextIconCard(
                      text: department.name,
                      iconUrl: department.iconUrl,
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
