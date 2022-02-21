import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vpapp/config.dart';

class DirectusService {
  late final Dio dio;
  late final CookieJar cj;

  DirectusService();

  Future<DirectusService> init() async {
    // Initialize Dio
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.directusEndpoint,
        responseType: ResponseType.json,
      ),
    );

    await _initInterceptors();

    return this;
  }

  Future<void> _initInterceptors() async {
    // Initialize Cache Options
    CacheOptions options = CacheOptions(
      store: BackupCacheStore(
        primary: MemCacheStore(),
        secondary: HiveCacheStore(null),
      ),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 30),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    // Add Cache Interceptor
    dio.interceptors.add(DioCacheInterceptor(options: options));

    // Initialize Cookie Jar
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    cj = PersistCookieJar(
      persistSession: true,
      ignoreExpires: true,
      storage: FileStorage('$appDocPath/.cookies/'),
    );

    // Add Cookies Interceptor
    dio.interceptors.add(CookieManager(cj));
  }
}
