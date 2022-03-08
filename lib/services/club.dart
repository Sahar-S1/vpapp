import 'package:vpapp/models/club.dart';

import 'package:vpapp/services/item.dart';

class ClubService extends ItemService<Club> {
  ClubService({required directus}) : super(directus: directus);

  @override
  String get name => 'club';

  @override
  List<String> get sort => ['sort'];

  @override
  List<String> get fields => ['*'];

  @override
  Club Function(Map<String, dynamic>) get fromMap => Club.fromMap;
}
