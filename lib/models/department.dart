import 'dart:convert';

class Department {
  final String name;
  final String vision;
  final String mission;
  final String outcomes;

  Department({
    required this.name,
    required this.vision,
    required this.mission,
    required this.outcomes,
  });

  Department copyWith({
    String? name,
    String? vision,
    String? mission,
    String? outcomes,
  }) {
    return Department(
      name: name ?? this.name,
      vision: vision ?? this.vision,
      mission: mission ?? this.mission,
      outcomes: outcomes ?? this.outcomes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vision': vision,
      'mission': mission,
      'outcomes': outcomes,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      name: map['name'] ?? '',
      vision: map['vision'] ?? '',
      mission: map['mission'] ?? '',
      outcomes: map['outcomes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Department(name: $name, vision: $vision, mission: $mission, outcomes: $outcomes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Department &&
        other.name == name &&
        other.vision == vision &&
        other.mission == mission &&
        other.outcomes == outcomes;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        vision.hashCode ^
        mission.hashCode ^
        outcomes.hashCode;
  }
}
