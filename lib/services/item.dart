import 'package:vpapp/services/directus.dart';

abstract class ItemService<I> {
  String get name;
  List<String> get fields;
  I Function(Map<String, dynamic>) get fromMap;

  String get endpoint => '/items/$name';

  final DirectusService _directus;

  const ItemService({required directus}) : _directus = directus;

  Future<int> getCount() async {
    var res = await _directus.dio.get(
      endpoint,
      queryParameters: {'aggregate[count]': 'id'},
    );

    return res.data['data'][0]['count']['id'] as int;
  }

  Future<I> getOne(int id) async {
    var res = await _directus.dio.get(
      endpoint,
      queryParameters: {
        'fields': fields,
        'filter[id][_eq]': id,
      },
    );

    return fromMap(res.data['data'][0] as Map<String, dynamic>);
  }

  Future<List<I>> getPage(int pageKey, int pageSize) async {
    var page = ((pageKey - 1) / pageSize) + 1;

    var res = await _directus.dio.get(
      endpoint,
      queryParameters: {
        'fields': fields,
        'page': page,
        'limit': pageSize,
      },
    );

    return (res.data['data'] as List<dynamic>).map((e) => fromMap(e)).toList();
  }

  Future<List<I>> getAll() async {
    var res = await _directus.dio.get(
      endpoint,
      queryParameters: {
        'fields': fields,
      },
    );

    return (res.data['data'] as List<dynamic>).map((e) => fromMap(e)).toList();
  }
}
