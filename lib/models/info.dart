import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:vpapp/config.dart';

class InfoSection {
  final int id;
  final String title;
  final String description;

  InfoSection({
    required this.id,
    required this.title,
    required this.description,
  });

  InfoSection copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return InfoSection(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory InfoSection.fromMap(Map<String, dynamic> map) {
    return InfoSection(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoSection.fromJson(String source) =>
      InfoSection.fromMap(json.decode(source));

  @override
  String toString() =>
      'InfoSection(id: $id, title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InfoSection &&
        other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}

class Info {
  final int id;
  final String name;
  final String icon;
  final List<InfoSection> sections;

  String get iconUrl => '${AppConfig.directusAssetsEndpoint}/$icon';

  Info({
    required this.id,
    required this.name,
    required this.icon,
    required this.sections,
  });

  Info copyWith({
    int? id,
    String? name,
    String? icon,
    List<InfoSection>? sections,
  }) {
    return Info(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
      sections: List<InfoSection>.from(
          map['sections']?.map((x) => InfoSection.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) => Info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Info(id: $id, name: $name, icon: $icon, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Info &&
        other.id == id &&
        other.name == name &&
        other.icon == icon &&
        listEquals(other.sections, sections);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ icon.hashCode ^ sections.hashCode;
  }
}
