import 'dart:convert';

import 'package:vpapp/config.dart';

class Department {
  final String name;
  final String vision;
  final String mission;
  final String outcomes;
  final String logo;

  String get logoUrl {
    return '${AppConfig.directusAssetsEndpoint}/$logo';
  }

  Department({
    required this.name,
    required this.vision,
    required this.mission,
    required this.outcomes,
    required this.logo,
  });

  Department copyWith({
    String? name,
    String? vision,
    String? mission,
    String? outcomes,
    String? logo,
  }) {
    return Department(
      name: name ?? this.name,
      vision: vision ?? this.vision,
      mission: mission ?? this.mission,
      outcomes: outcomes ?? this.outcomes,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vision': vision,
      'mission': mission,
      'outcomes': outcomes,
      'logo': logo,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      name: map['name'] ?? '',
      vision: map['vision'] ?? '',
      mission: map['mission'] ?? '',
      outcomes: map['outcomes'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Department(name: $name, vision: $vision, mission: $mission, outcomes: $outcomes, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Department &&
        other.name == name &&
        other.vision == vision &&
        other.mission == mission &&
        other.outcomes == outcomes &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        vision.hashCode ^
        mission.hashCode ^
        outcomes.hashCode ^
        logo.hashCode;
  }
}
