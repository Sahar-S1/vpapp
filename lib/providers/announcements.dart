import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/providers/directus.dart';

class AnnouncementsProvider {
  static const String _endpoint = '/items/announcement';

  final DirectusProvider _directus;

  AnnouncementsProvider({required directus}) : _directus = directus;

  Future<int> getCount() async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {'aggregate[count]': 'id'},
    );

    return res.data['data'][0]['count']['id'] as int;
  }

  Future<List<Announcement>> getPage(int pageKey, int pageSize) async {
    var page = ((pageKey - 1) / pageSize) + 1;

    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {
        'fields': ['*.*'],
        'page': page,
        'limit': pageSize,
      },
    );

    return (res.data['data'] as List<dynamic>)
        .map((e) => Announcement.fromMap(e))
        .toList();
  }

  Future<List<Announcement>> getAll() async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {
        'fields': ['*.*'],
      },
    );

    return (res.data['data'] as List<dynamic>)
        .map((e) => Announcement.fromMap(e))
        .toList();
  }
}
