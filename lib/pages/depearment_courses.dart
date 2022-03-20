import 'package:flutter/material.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/department/courses_list.dart';

class DepartmentCoursesPage extends StatelessWidget {
  static const routeName = 'department-course';

  final int id;
  final int year;
  final int semester;

  const DepartmentCoursesPage({
    Key? key,
    required this.id,
    required this.year,
    required this.semester,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Courses',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => CoursesList(
        departmentId: id,
        yearId: year,
        semesterId: semester,
        scrollController: sc,
      ),
    );
  }
}
