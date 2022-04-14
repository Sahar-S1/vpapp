import 'dart:convert';

import 'package:vpapp/config.dart';

class DirectusToken {
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  DirectusToken({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  DirectusToken copyWith({
    String? accessToken,
    int? expiresIn,
    String? refreshToken,
  }) {
    return DirectusToken(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'expires': expiresIn,
      'refresh_token': refreshToken,
    };
  }

  factory DirectusToken.fromMap(Map<String, dynamic> map) {
    return DirectusToken(
      accessToken: map['access_token'] ?? '',
      expiresIn: map['expires']?.toInt() ?? 0,
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectusToken.fromJson(String source) =>
      DirectusToken.fromMap(json.decode(source));

  @override
  String toString() =>
      'DirectusToken(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DirectusToken &&
        other.accessToken == accessToken &&
        other.expiresIn == expiresIn &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^ expiresIn.hashCode ^ refreshToken.hashCode;
}

class DirectusUser {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  final String role;

  String get name => '$firstName $lastName';
  String get avatarUrl => '${AppConfig.directusAssetsEndpoint}/$avatar';

  DirectusUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.role,
  });

  DirectusUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? avatar,
    String? role,
  }) {
    return DirectusUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'avatar': avatar,
      'role': role,
    };
  }

  factory DirectusUser.fromMap(Map<String, dynamic> map) {
    return DirectusUser(
      id: map['id'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
      role: map['role']['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectusUser.fromJson(String source) =>
      DirectusUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DirectusUser(id: $id, firstName: $firstName, lastName: $lastName, email: $email, avatar: $avatar, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DirectusUser &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.avatar == avatar &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        role.hashCode;
  }
}
