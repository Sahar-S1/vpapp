import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:vpapp/models/directus.dart';

class DisucssionComment {
  static final _dateCreatedFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  final int id;
  final String comment;
  final DirectusUser userCreated;
  final DateTime dateCreated;

  DisucssionComment({
    required this.id,
    required this.comment,
    required this.userCreated,
    required this.dateCreated,
  });

  DisucssionComment copyWith({
    int? id,
    String? comment,
    DirectusUser? userCreated,
    DateTime? dateCreated,
  }) {
    return DisucssionComment(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      userCreated: userCreated ?? this.userCreated,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comment': comment,
      'user_created': userCreated.toMap(),
      'date_created': _dateCreatedFormat.format(dateCreated),
    };
  }

  factory DisucssionComment.fromMap(Map<String, dynamic> map) {
    return DisucssionComment(
      id: map['id']?.toInt() ?? 0,
      comment: map['comment'] ?? '',
      userCreated: DirectusUser.fromMap(map['user_created']),
      dateCreated: _dateCreatedFormat.parse(map['date_created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DisucssionComment.fromJson(String source) =>
      DisucssionComment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DisucssionComment(id: $id, comment: $comment, userCreated: $userCreated, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DisucssionComment &&
        other.id == id &&
        other.comment == comment &&
        other.userCreated == userCreated &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        comment.hashCode ^
        userCreated.hashCode ^
        dateCreated.hashCode;
  }
}

class Discussion {
  static final _dateCreatedFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  final int id;
  final String title;
  final List<DisucssionComment> comments;
  final DirectusUser userCreated;
  final DateTime dateCreated;

  Discussion({
    required this.id,
    required this.title,
    required this.comments,
    required this.userCreated,
    required this.dateCreated,
  });

  Discussion copyWith({
    int? id,
    String? title,
    List<DisucssionComment>? comments,
    DirectusUser? userCreated,
    DateTime? dateCreated,
  }) {
    return Discussion(
      id: id ?? this.id,
      title: title ?? this.title,
      comments: comments ?? this.comments,
      userCreated: userCreated ?? this.userCreated,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'comments': comments.map((x) => x.toMap()).toList(),
      'user_created': userCreated.toMap(),
      'date_created': _dateCreatedFormat.format(dateCreated),
    };
  }

  factory Discussion.fromMap(Map<String, dynamic> map) {
    return Discussion(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      comments: List<DisucssionComment>.from(
          map['comments']?.map((x) => DisucssionComment.fromMap(x))),
      userCreated: DirectusUser.fromMap(map['user_created']),
      dateCreated: _dateCreatedFormat.parse(map['date_created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Discussion.fromJson(String source) =>
      Discussion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Discussion(id: $id, title: $title, comments: $comments, userCreated: $userCreated, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Discussion &&
        other.id == id &&
        other.title == title &&
        listEquals(other.comments, comments) &&
        other.userCreated == userCreated &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        comments.hashCode ^
        userCreated.hashCode ^
        dateCreated.hashCode;
  }
}
