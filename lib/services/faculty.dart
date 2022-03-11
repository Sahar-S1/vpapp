import 'package:vpapp/models/faculty.dart';
import 'package:vpapp/services/item.dart';

class FacultyService extends ItemService<Faculty> {
  FacultyService({required directus}) : super(directus: directus);

  @override
  String get name => 'faculty';

  @override
  List<String> get sort => ['sort'];

  @override
  List<String> get fields => ['*', 'role.*'];

  @override
  Faculty Function(Map<String, dynamic> p1) get fromMap => Faculty.fromMap;

  @override
  String? get filter => 'filter[department][_eq]';
}
