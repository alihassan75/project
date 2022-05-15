// ignore_for_file: dead_null_aware_expression

import 'dart:convert';
import 'dart:core';
import '../services/middleware.dart';
import 'task.dart';
import 'group.dart';

class Project {
  Project({
    required this.url,
    required this.id,
    required this.owner,
    required this.title,
    required this.created,
    required this.tasks,
    required this.groups,
  });

  final String url;
  final int id;
  final String owner;
  final String title;
  final DateTime created;
  final List tasks;
  final List groups;

  Project copyWith({
    required String url,
    required int id,
    required String owner,
    required String title,
    required DateTime created,
    required List tasks,
    required List groups,
  }) =>
      Project(
        url: url ?? this.url,
        id: id ?? this.id,
        owner: owner ?? this.owner,
        title: title ?? this.title,
        created: created ?? this.created,
        tasks: tasks ?? this.tasks,
        groups: groups ?? this.groups,
      );

  factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        url: json["url"],
        id: json["id"],
        owner: json["owner"],
        title: json["title"],
        created: DateTime.parse(
          json["created"],
        ),
        tasks: json["tasks"] ?? [],
        groups: json["groups"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "owner": owner,
        "title": title,
        "created": created.toIso8601String(),
        "tasks": tasks.toString(),
        "groups": groups.toString(),
      };
}
