import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/services/item.dart';

class AnnouncementService extends ItemService<Announcement> {
  AnnouncementService({required directus}) : super(directus: directus);

  @override
  List<String> get fields => ['*.*'];

  @override
  Announcement Function(Map<String, dynamic>) get fromMap =>
      Announcement.fromMap;

  @override
  String get name => 'announcement';
}
