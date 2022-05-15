// ignore_for_file: dead_null_aware_expression

import 'dart:convert';
import 'dart:core';

import '../services/middleware.dart';

class Group {
  Group({
    required this.url,
    required this.title,
    required this.owner,
    required this.members,
    required this.created,
    required this.active,
    required this.project,
  });

  final String url;
  final String title;
  final String owner;
  final List members;
  final DateTime created;
  final bool active;
  final String project;

  Group copyWith({
    required String url,
    required String title,
    required String owner,
    required List members,
    required DateTime created,
    required bool active,
    required String project,
  }) =>
      Group(
        url: url ?? this.url,
        title: title ?? this.title,
        owner: owner ?? this.owner,
        members: members ?? this.members,
        created: created ?? this.created,
        active: active ?? this.active,
        project: project ?? this.project,
      );

  factory Group.fromRawJson(String str) => Group.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      url: json["url"],
      title: json["title"],
      owner: json["owner"],
      members: json["members"] ?? [],
      created: DateTime.parse(
        json["created"],
      ),
      active: json["active"],
      project: json["project"],
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
        "owner": owner,
        "members": members.toString(),
        "created": created.toIso8601String(),
        "active": active,
        "project": project,
      };
}
