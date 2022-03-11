import 'package:flutter/material.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/department/faculty_list.dart';

class DepartmentFacultyPage extends StatelessWidget {
  static const routeName = 'department-faculty';

  final int id;

  const DepartmentFacultyPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Faculty',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => FacultyList(departmentId: id, scrollController: sc),
    );
  }
}
