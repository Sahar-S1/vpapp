import 'package:dio/dio.dart';
import 'package:vpapp/config.dart';

class DirectusProvider {
  late final Dio dio;

  DirectusProvider() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.directusEndpoint,
        responseType: ResponseType.json,
      ),
    );
  }
}
