import 'package:vpapp/models/discussion.dart';
import 'package:vpapp/services/item.dart';

class DiscussionService extends ItemService<Discussion> {
  DiscussionService({required directus}) : super(directus: directus);

  @override
  String get name => 'discussion';

  @override
  List<String> get sort => ['sort', '-date_created'];

  @override
  List<String> get fields => [
        '*',
        'comments.*',
        'user_created.*',
        'comments.user_created.*',
      ];

  @override
  Discussion Function(Map<String, dynamic>) get fromMap => Discussion.fromMap;
}
