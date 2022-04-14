import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:vpapp/models/directus.dart';

import 'package:vpapp/services/directus.dart';

class AuthService with ChangeNotifier {
  static const String _loginEndpoint = '/auth/login';
  static const String _refreshEndpoint = '/auth/refresh';
  static const String _logoutEndpoint = '/auth/logout';
  static const String _currentUserEndpoint = '/users/me';

  final DirectusService _directus;
  final Fresh<DirectusToken> fresh;
  ValueNotifier<DirectusUser?> currentUser = ValueNotifier(null);

  AuthService({required DirectusService directus})
      : _directus = directus,
        fresh = Fresh<DirectusToken>(
          tokenHeader: (token) {
            return {
              'Authorization': 'Bearer ${token.accessToken}',
            };
          },
          tokenStorage: DirectusTokenStorage(),
          refreshToken: (token, httpClient) async {
            if (token == null) {
              throw RevokeTokenException();
            }

            var res = await directus.dio.post(
              _refreshEndpoint,
              data: token.toMap(),
            );

            return DirectusToken.fromMap(res.data);
          },
        ) {
    directus.dio.interceptors.add(fresh);
    fresh.authenticationStatus.listen((event) => _refreshCurrentUser());
  }

  Future<void> login(String email, String password) async {
    try {
      var res = await _directus.dio.post(
        _loginEndpoint,
        data: {
          'email': email,
          'password': password,
          'mode': 'json',
        },
      );
      await fresh.setToken(DirectusToken.fromMap(res.data['data']));
    } on DioError catch (error) {
      if (kDebugMode) {
        print(error.response?.data);
      }
      await fresh.setToken(null);
    }
  }

  Future<void> logout() async {
    try {
      await _directus.dio.post(
        _logoutEndpoint,
        data: {
          'refresh_token': (await fresh.token)?.refreshToken,
        },
      );
    } on DioError catch (error) {
      if (kDebugMode) {
        print(error.response?.data);
      }
    }

    await fresh.setToken(null);
  }

  Future<void> _refreshCurrentUser() async {
    try {
      var res = await _directus.dio.get(
        _currentUserEndpoint,
        queryParameters: {
          'fields': [
            'id',
            'first_name',
            'last_name',
            'email',
            'avatar',
            'role.name',
          ],
        },
      );
      currentUser.value = DirectusUser.fromMap(res.data['data']);
    } on DioError catch (error) {
      if (kDebugMode) {
        print(error.response?.data);
      }
      currentUser.value = null;
    }
    notifyListeners();
  }
}

class DirectusTokenStorage extends TokenStorage<DirectusToken> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _tokenKey = 'vpcms_directus_token_key';

  @override
  Future<void> delete() async {
    await _storage.delete(key: _tokenKey);
  }

  @override
  Future<DirectusToken?> read() async {
    var val = await _storage.read(key: _tokenKey);

    if (val == null) return null;
    return DirectusToken.fromJson(val);
  }

  @override
  Future<void> write(DirectusToken token) async {
    await _storage.write(key: _tokenKey, value: token.toJson());
  }
}
