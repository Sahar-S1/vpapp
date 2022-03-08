import 'package:vpapp/models/info.dart';

import 'package:vpapp/services/item.dart';

class InfoService extends ItemService<Info> {
  InfoService({required directus}) : super(directus: directus);

  @override
  String get name => 'info_page';

  @override
  List<String> get sort => ['sort'];

  @override
  List<String> get fields => ['*', 'sections.*'];

  @override
  Info Function(Map<String, dynamic>) get fromMap => Info.fromMap;
}
