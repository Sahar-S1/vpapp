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
        'user_created.role.*',
        'comments.user_created.*',
        'comments.user_created.role.*',
      ];

  @override
  Discussion Function(Map<String, dynamic>) get fromMap => Discussion.fromMap;

  Future<int> discuss(String title) async {
    var res = await directus.dio.post(
      endpoint,
      data: {
        'title': title,
      },
    );

    return res.data['data']['id'];
  }

  Future<int> comment(Discussion discussion, String text) async {
    var res = await directus.dio.post(
      '${endpoint}_comment',
      data: {
        'comment': text,
        'discussion': discussion.id,
      },
    );

    return res.data['data']['id'];
  }
}
