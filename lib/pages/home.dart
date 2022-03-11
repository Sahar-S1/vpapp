import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import 'package:vpapp/components/common/drawer.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/models/department.dart';
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
    var theme = Theme.of(context);

    return PageTemplate(
      header: AppConfig.title,
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: const AppDrawer(),
        body: child,
      ),
      childBuilder: (sc) => SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => context.goNamed(InfoListPage.routeName),
              child: TextIconCard(
                text: 'About College',
                icon: CachedNetworkImage(
                  imageUrl:
                      '${AppConfig.directusAssetsEndpoint}/e22f1a67-acca-4c06-9872-b409440a1440.png',
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
            ...departments
                .map(
                  (department) => TextIconCard(
                    text: department.name,
                    icon: CachedNetworkImage(
                      imageUrl: department.iconUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
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
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
