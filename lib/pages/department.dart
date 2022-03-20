import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/common/page_error.dart';
import 'package:vpapp/components/common/page_loading.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/models/department.dart';
import 'package:vpapp/pages/department_faculty.dart';
import 'package:vpapp/pages/department_info.dart';
import 'package:vpapp/pages/depearment_years.dart';
import 'package:vpapp/services/department.dart';

class DepartmentPage extends StatelessWidget with GetItMixin {
  static const routeName = 'department';

  final int id;

  DepartmentPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Department>(
      future: get<DepartmentService>().getOne(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PageLoading();
        }

        if (snapshot.hasError) {
          return const PageError();
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
                InkWell(
                  onTap: () => context.goNamed(
                    DepartmentInfoPage.routeName,
                    params: {
                      'id': department.id.toString(),
                    },
                  ),
                  child: const TextIconCard(
                    text: 'Information',
                    iconUrl:
                        '${AppConfig.directusAssetsEndpoint}/6f0a54bc-f17b-4e08-a494-f0dd46ba08ca',
                  ),
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
                        '${AppConfig.directusAssetsEndpoint}/769746a4-824c-49a0-a1e9-4a8edf0feed4',
                  ),
                ),
                InkWell(
                  onTap: () => context.goNamed(
                    DepartmentYearsPage.routeName,
                    params: {
                      'id': department.id.toString(),
                    },
                  ),
                  child: const TextIconCard(
                    text: 'Courses',
                    iconUrl:
                        '${AppConfig.directusAssetsEndpoint}/a7dec110-c387-4733-8185-041c807f9bdb',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
