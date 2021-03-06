import 'package:vpapp/models/blog.dart';
import 'package:vpapp/services/item.dart';

class BlogService extends ItemService<Blog> {
  BlogService({required directus}) : super(directus: directus);

  @override
  String get name => 'blog';

  @override
  List<String> get sort => ['sort', '-date_published'];

  @override
  List<String> get fields => ['*'];

  @override
  Blog Function(Map<String, dynamic>) get fromMap => Blog.fromMap;
}
