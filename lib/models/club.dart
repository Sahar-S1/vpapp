import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/utils/color.dart';

class Club {
  final int id;
  final String name;
  final String logo;
  final String agenda;
  final String description;
  final Color color;

  String get logoUrl {
    return '${AppConfig.directusAssetsEndpoint}/$logo';
  }

  Club({
    required this.id,
    required this.name,
    required this.logo,
    required this.agenda,
    required this.description,
    required this.color,
  });

  Club copyWith({
    int? id,
    String? name,
    String? logo,
    String? agenda,
    String? description,
    Color? color,
  }) {
    return Club(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      agenda: agenda ?? this.agenda,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'agenda': agenda,
      'description': description,
      'color': colorToHex(color),
    };
  }

  factory Club.fromMap(Map<String, dynamic> map) {
    return Club(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      agenda: map['agenda'] ?? '',
      description: map['description'] ?? '',
      color: hexToColor(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Club.fromJson(String source) => Club.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Club(id: $id, name: $name, logo: $logo, agenda: $agenda, description: $description, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Club &&
        other.id == id &&
        other.name == name &&
        other.logo == logo &&
        other.agenda == agenda &&
        other.description == description &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        logo.hashCode ^
        agenda.hashCode ^
        description.hashCode ^
        color.hashCode;
  }
}
