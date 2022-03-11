import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/models/department.dart';
import 'package:vpapp/pages/department_faculty.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/services/department.dart';

class DepartmentPage extends StatelessWidget with GetItMixin {
  static const routeName = 'department';

  final int id;

  DepartmentPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FutureBuilder<Department>(
      future: get<DepartmentService>().getOne(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('Loading...')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SelectableText(snapshot.error.toString()),
                  Text(
                    'Some internall error !!',
                    style: theme.textTheme.headlineMedium
                        ?.apply(color: theme.errorColor),
                  ),
                  TextButton(
                    onPressed: () => context.goNamed(HomePage.routeName),
                    child: const Text('Home'),
                  ),
                ],
              ),
            ),
          );
        }

        assert(snapshot.hasData);
        final department = snapshot.data!;
        return PageTemplate(
          header: department.name,
          parentBuilder: ({required child, required title}) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: child,
          ),
          childBuilder: (sc) => SingleChildScrollView(
            controller: sc,
            child: Column(
              children: [
                const TextIconCard(
                  text: 'Information',
                  iconUrl:
                      '${AppConfig.directusAssetsEndpoint}/bf3f1535-1d2d-4a4d-851a-949e913df76a',
                ),
                InkWell(
                  onTap: () => context.goNamed(
                    DepartmentFacultyPage.routeName,
                    params: {
                      'id': department.id.toString(),
                    },
                  ),
                  child: const TextIconCard(
                    text: 'Faculty',
                    iconUrl:
                        '${AppConfig.directusAssetsEndpoint}/bf3f1535-1d2d-4a4d-851a-949e913df76a',
                  ),
                ),
                const TextIconCard(
                  text: 'Courses',
                  iconUrl:
                      '${AppConfig.directusAssetsEndpoint}/bf3f1535-1d2d-4a4d-851a-949e913df76a',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
