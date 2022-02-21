import 'dart:convert';

import 'package:intl/intl.dart';

class AnnouncementCategory {
  final int id;
  final String name;
  final String color;

  AnnouncementCategory({
    required this.id,
    required this.name,
    required this.color,
  });

  AnnouncementCategory copyWith({
    int? id,
    String? name,
    String? color,
  }) {
    return AnnouncementCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory AnnouncementCategory.fromMap(Map<String, dynamic> map) {
    return AnnouncementCategory(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      color: map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnouncementCategory.fromJson(String source) =>
      AnnouncementCategory.fromMap(json.decode(source));

  @override
  String toString() =>
      'AnnouncementCategory(id: $id, name: $name, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnnouncementCategory &&
        other.id == id &&
        other.name == name &&
        other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;
}

class Announcement {
  static final DateFormat _datePublishedFormat = DateFormat('yyyy-MM-dd');

  final int id;
  final String title;
  final DateTime datePublished;
  final String description;
  final AnnouncementCategory category;

  Announcement({
    required this.id,
    required this.title,
    required this.datePublished,
    required this.description,
    required this.category,
  });

  Announcement copyWith({
    int? id,
    String? title,
    DateTime? datePublished,
    String? description,
    AnnouncementCategory? category,
  }) {
    return Announcement(
      id: id ?? this.id,
      title: title ?? this.title,
      datePublished: datePublished ?? this.datePublished,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date_published': _datePublishedFormat.format(datePublished),
      'description': description,
      'category': category.toMap(),
    };
  }

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      datePublished: _datePublishedFormat.parse(map['date_published']),
      description: map['description'] ?? '',
      category: AnnouncementCategory.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Announcement.fromJson(String source) =>
      Announcement.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Announcement(id: $id, title: $title, datePublished: ${_datePublishedFormat.format(datePublished)}, description: $description, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Announcement &&
        other.id == id &&
        other.title == title &&
        other.datePublished == datePublished &&
        other.description == description &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        datePublished.hashCode ^
        description.hashCode ^
        category.hashCode;
  }
}
