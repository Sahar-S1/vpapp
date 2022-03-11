import 'dart:convert';

import 'package:vpapp/config.dart';

class Role {
  final String name;
  final String abbrivation;

  Role({
    required this.name,
    required this.abbrivation,
  });

  Role copyWith({
    String? name,
    String? abbrivation,
  }) {
    return Role(
      name: name ?? this.name,
      abbrivation: abbrivation ?? this.abbrivation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'abbrivation': abbrivation,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      name: map['name'] ?? '',
      abbrivation: map['abbrivation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source));

  @override
  String toString() => 'Role(name: $name, abbrivation: $abbrivation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Role &&
        other.name == name &&
        other.abbrivation == abbrivation;
  }

  @override
  int get hashCode => name.hashCode ^ abbrivation.hashCode;
}

class Faculty {
  final String name;
  final Role role;
  final int experience;
  final String photo;
  final int departmentId;

  String get photoUrl {
    return '${AppConfig.directusAssetsEndpoint}/$photo';
  }

  Faculty({
    required this.name,
    required this.role,
    required this.experience,
    required this.photo,
    required this.departmentId,
  });

  Faculty copyWith({
    String? name,
    Role? role,
    int? experience,
    String? photo,
    int? departmentId,
  }) {
    return Faculty(
      name: name ?? this.name,
      role: role ?? this.role,
      experience: experience ?? this.experience,
      photo: photo ?? this.photo,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role.toMap(),
      'experience': experience,
      'photo': photo,
      'departmentId': departmentId,
    };
  }

  factory Faculty.fromMap(Map<String, dynamic> map) {
    return Faculty(
      name: map['name'] ?? '',
      role: Role.fromMap(map['role']),
      experience: map['experience']?.toInt() ?? 0,
      photo: map['photo'] ?? '',
      departmentId: map['department']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Faculty.fromJson(String source) =>
      Faculty.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Faculty(name: $name, role: $role, experience: $experience, photo: $photo, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Faculty &&
        other.name == name &&
        other.role == role &&
        other.experience == experience &&
        other.photo == photo &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        role.hashCode ^
        experience.hashCode ^
        photo.hashCode ^
        departmentId.hashCode;
  }
}
