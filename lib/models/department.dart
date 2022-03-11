import 'dart:convert';

import 'package:vpapp/config.dart';

class Department {
  final String name;
  final String abbr;
  final String vision;
  final String mission;
  final String outcomes;
  final String icon;

  String get iconUrl {
    return '${AppConfig.directusAssetsEndpoint}/$icon';
  }

  Department({
    required this.name,
    required this.abbr,
    required this.vision,
    required this.mission,
    required this.outcomes,
    required this.icon,
  });

  Department copyWith({
    String? name,
    String? abbr,
    String? vision,
    String? mission,
    String? outcomes,
    String? icon,
  }) {
    return Department(
      name: name ?? this.name,
      abbr: abbr ?? this.abbr,
      vision: vision ?? this.vision,
      mission: mission ?? this.mission,
      outcomes: outcomes ?? this.outcomes,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'abbr': abbr,
      'vision': vision,
      'mission': mission,
      'outcomes': outcomes,
      'icon': icon,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      name: map['name'] ?? '',
      abbr: map['abbr'] ?? '',
      vision: map['vision'] ?? '',
      mission: map['mission'] ?? '',
      outcomes: map['outcomes'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Department(name: $name, abbr: $abbr, vision: $vision, mission: $mission, outcomes: $outcomes, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Department &&
        other.name == name &&
        other.abbr == abbr &&
        other.vision == vision &&
        other.mission == mission &&
        other.outcomes == outcomes &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        abbr.hashCode ^
        vision.hashCode ^
        mission.hashCode ^
        outcomes.hashCode ^
        icon.hashCode;
  }
}
