import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/services/directus.dart';

class AnnouncementsService {
  static const String _endpoint = '/items/announcement';

  final DirectusService _directus;

  AnnouncementsService({required directus}) : _directus = directus;

  Future<int> getCount() async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {'aggregate[count]': 'id'},
    );

    return res.data['data'][0]['count']['id'] as int;
  }

  Future<Announcement> getOne(int id) async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {
        'fields': ['*.*'],
        'filter[id][_eq]': id,
      },
    );

    return Announcement.fromMap(res.data['data'][0] as Map<String, dynamic>);
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
