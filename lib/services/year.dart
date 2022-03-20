import 'package:vpapp/models/course.dart';
import 'package:vpapp/services/item.dart';

class YearService extends ItemService<Year> {
  YearService({required directus}) : super(directus: directus);

  @override
  String get name => 'year';

  @override
  List<String> get sort => ['sort', 'number'];

  @override
  List<String> get fields => ['*'];

  @override
  Year Function(Map<String, dynamic> p1) get fromMap => Year.fromMap;
}
