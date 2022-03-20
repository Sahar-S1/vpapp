import 'package:flutter/material.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/department/semesters_list.dart';

class DepartmentSemestersPage extends StatelessWidget {
  static const routeName = 'department-semester';

  final int id;
  final int year;

  const DepartmentSemestersPage({
    Key? key,
    required this.id,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Semesters',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => SemestersList(
        departmentId: id,
        yearId: year,
        scrollController: sc,
      ),
    );
  }
}
