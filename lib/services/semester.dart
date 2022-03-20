import 'package:vpapp/models/course.dart';
import 'package:vpapp/services/item.dart';

class SemesterService extends ItemService<Semester> {
  SemesterService({required directus}) : super(directus: directus);

  @override
  String get name => 'semester';

  @override
  List<String> get sort => ['sort', 'number'];

  @override
  List<String> get fields => ['*.*'];

  @override
  Semester Function(Map<String, dynamic> p1) get fromMap => Semester.fromMap;
}
