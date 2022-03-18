import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/common/page_error.dart';
import 'package:vpapp/components/common/page_loading.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/info/info_sections_column.dart';
import 'package:vpapp/models/department.dart';
import 'package:vpapp/models/info.dart';
import 'package:vpapp/services/department.dart';

class DepartmentInfoPage extends StatelessWidget with GetItMixin {
  static const routeName = 'department-info';

  final int id;

  DepartmentInfoPage({Key? key, required this.id}) : super(key: key);

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
            child: InfoSectionsColumn(
              info: Info(
                id: department.id,
                name: department.name,
                icon: department.icon,
                sections: [
                  InfoSection(
                    id: 1,
                    title: 'Vision',
                    description: department.vision,
                  ),
                  InfoSection(
                    id: 2,
                    title: 'Mission',
                    description: department.mission,
                  ),
                  InfoSection(
                    id: 3,
                    title: 'Outcomes',
                    description: department.outcomes,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
