import 'package:flutter/material.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/department/years_list.dart';

class DepartmentYearsPage extends StatelessWidget {
  static const routeName = 'department-year';

  final int id;

  const DepartmentYearsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Years',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => YearsList(departmentId: id, scrollController: sc),
    );
  }
}
