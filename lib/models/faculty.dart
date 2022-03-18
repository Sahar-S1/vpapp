import 'dart:convert';

import 'package:vpapp/config.dart';

class Role {
  final int id;
  final String name;
  final String abbrivation;

  Role({
    required this.id,
    required this.name,
    required this.abbrivation,
  });

  Role copyWith({
    int? id,
    String? name,
    String? abbrivation,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
      abbrivation: abbrivation ?? this.abbrivation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'abbrivation': abbrivation,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      abbrivation: map['abbrivation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source));

  @override
  String toString() => 'Role(id: $id, name: $name, abbrivation: $abbrivation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Role &&
        other.id == id &&
        other.name == name &&
        other.abbrivation == abbrivation;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ abbrivation.hashCode;
}

class Faculty {
  final int id;
  final String name;
  final Role role;
  final int experience;
  final String photo;
  final int departmentId;

  String get photoUrl => '${AppConfig.directusAssetsEndpoint}/$photo';

  Faculty({
    required this.id,
    required this.name,
    required this.role,
    required this.experience,
    required this.photo,
    required this.departmentId,
  });

  Faculty copyWith({
    int? id,
    String? name,
    Role? role,
    int? experience,
    String? photo,
    int? departmentId,
  }) {
    return Faculty(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      experience: experience ?? this.experience,
      photo: photo ?? this.photo,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role.toMap(),
      'experience': experience,
      'photo': photo,
      'departmentId': departmentId,
    };
  }

  factory Faculty.fromMap(Map<String, dynamic> map) {
    return Faculty(
      id: map['id']?.toInt() ?? 0,
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
    return 'Faculty(id: $id, name: $name, role: $role, experience: $experience, photo: $photo, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Faculty &&
        other.id == id &&
        other.name == name &&
        other.role == role &&
        other.experience == experience &&
        other.photo == photo &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        role.hashCode ^
        experience.hashCode ^
        photo.hashCode ^
        departmentId.hashCode;
  }
}
