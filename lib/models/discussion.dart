import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:vpapp/models/directus.dart';

class DisucssionComment {
  static final _dateCreatedFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  final String comment;
  final DirectusUser userCreated;
  final DateTime dateCreated;

  DisucssionComment({
    required this.comment,
    required this.userCreated,
    required this.dateCreated,
  });

  DisucssionComment copyWith({
    String? comment,
    DirectusUser? userCreated,
    DateTime? dateCreated,
  }) {
    return DisucssionComment(
      comment: comment ?? this.comment,
      userCreated: userCreated ?? this.userCreated,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'user_created': userCreated.toMap(),
      'date_created': _dateCreatedFormat.format(dateCreated),
    };
  }

  factory DisucssionComment.fromMap(Map<String, dynamic> map) {
    return DisucssionComment(
      comment: map['comment'] ?? '',
      userCreated: DirectusUser.fromMap(map['user_created']),
      dateCreated: _dateCreatedFormat.parse(map['date_created']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DisucssionComment.fromJson(String source) =>
      DisucssionComment.fromMap(json.decode(source));

  @override
  String toString() =>
      'DisucssionComment(comment: $comment, userCreated: $userCreated, dateCreated: $dateCreated)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DisucssionComment &&
        other.comment == comment &&
        other.userCreated == userCreated &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode =>
      comment.hashCode ^ userCreated.hashCode ^ dateCreated.hashCode;
}

class Discussion {
  static final _dateCreatedFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  final String title;
  final List<DisucssionComment> comments;
  final DirectusUser userCreated;
  final DateTime dateCreated;

  Discussion({
    required this.title,
    required this.comments,
    required this.userCreated,
    required this.dateCreated,
  });

  Discussion copyWith({
    String? title,
    List<DisucssionComment>? comments,
    DirectusUser? userCreated,
    DateTime? dateCreated,
  }) {
    return Discussion(
      title: title ?? this.title,
      comments: comments ?? this.comments,
      userCreated: userCreated ?? this.userCreated,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'comments': comments.map((x) => x.toMap()).toList(),
      'user_created': userCreated.toMap(),
      'date_created': _dateCreatedFormat.format(dateCreated),
    };
  }

  factory Discussion.fromMap(Map<String, dynamic> map) {
    return Discussion(
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
    return 'Discussion(title: $title, comments: $comments, userCreated: $userCreated, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Discussion &&
        other.title == title &&
        listEquals(other.comments, comments) &&
        other.userCreated == userCreated &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        comments.hashCode ^
        userCreated.hashCode ^
        dateCreated.hashCode;
  }
}
