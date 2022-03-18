import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:vpapp/config.dart';

class Blog {
  static final DateFormat _datePublishedFormat = DateFormat('yyyy-MM-dd');

  final int id;
  final String title;
  final String author;
  final String content;
  final String image;
  final List<String> tags;
  final DateTime datePublished;

  String get imageUrl => '${AppConfig.directusAssetsEndpoint}/$image';

  Blog({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.image,
    required this.tags,
    required this.datePublished,
  });

  Blog copyWith({
    int? id,
    String? title,
    String? author,
    String? content,
    String? image,
    List<String>? tags,
    DateTime? datePublished,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      content: content ?? this.content,
      image: image ?? this.image,
      tags: tags ?? this.tags,
      datePublished: datePublished ?? this.datePublished,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'content': content,
      'image': image,
      'tags': tags,
      'date_published': _datePublishedFormat.format(datePublished),
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      content: map['content'] ?? '',
      image: map['image'] ?? '',
      tags: List<String>.from(map['tags']),
      datePublished: _datePublishedFormat.parse(map['date_published']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Blog(id: $id, title: $title, author: $author, content: $content, image: $image, tags: $tags, datePublished: $datePublished)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Blog &&
        other.id == id &&
        other.title == title &&
        other.author == author &&
        other.content == content &&
        other.image == image &&
        listEquals(other.tags, tags) &&
        other.datePublished == datePublished;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        content.hashCode ^
        image.hashCode ^
        tags.hashCode ^
        datePublished.hashCode;
  }
}
