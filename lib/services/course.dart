import 'package:vpapp/models/course.dart';
import 'package:vpapp/services/item.dart';

class CourseService extends ItemService<Course> {
  CourseService({required directus}) : super(directus: directus);

  @override
  String get name => 'department_course';

  @override
  List<String> get sort => [];

  @override
  List<String> get fields => ['*.*', 'semester_id.year.*'];

  @override
  Course Function(Map<String, dynamic> p1) get fromMap => Course.fromMap;
}
