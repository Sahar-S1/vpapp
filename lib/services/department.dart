import 'package:vpapp/models/department.dart';
import 'package:vpapp/services/item.dart';

class DepartmentService extends ItemService<Department> {
  DepartmentService({required directus}) : super(directus: directus);

  @override
  String get name => 'department';

  @override
  List<String> get sort => ['sort'];

  @override
  List<String> get fields => ['*'];

  @override
  Department Function(Map<String, dynamic> p1) get fromMap =>
      Department.fromMap;
}
