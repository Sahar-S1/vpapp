import 'package:vpapp/models/club.dart';
import 'package:vpapp/services/directus.dart';

class ClubService {
  static const String _endpoint = '/items/club';

  final DirectusService _directus;

  ClubService({required directus}) : _directus = directus;

  Future<int> getCount() async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {'aggregate[count]': 'id'},
    );

    return res.data['data'][0]['count']['id'] as int;
  }

  Future<Club> getOne(int id) async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {
        'filter[id][_eq]': id,
      },
    );

    return Club.fromMap(res.data['data'][0] as Map<String, dynamic>);
  }

  Future<List<Club>> getPage(int pageKey, int pageSize) async {
    var page = ((pageKey - 1) / pageSize) + 1;

    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {
        'page': page,
        'limit': pageSize,
      },
    );

    return (res.data['data'] as List<dynamic>)
        .map((e) => Club.fromMap(e))
        .toList();
  }

  Future<List<Club>> getAll() async {
    var res = await _directus.dio.get(
      _endpoint,
      queryParameters: {},
    );

    return (res.data['data'] as List<dynamic>)
        .map((e) => Club.fromMap(e))
        .toList();
  }
}
