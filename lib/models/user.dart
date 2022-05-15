// ignore_for_file: dead_null_aware_expression

import 'dart:convert';
import 'dart:core';

import 'package:project/helpers/constants.dart';
// import '../services/middleware.dart';
// import 'project.dart';
// import 'task.dart';
// import 'group.dart';

///* Data model class for user
class User {
  User({
    required this.url,
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.projects,
    required this.tasks,
    required this.groups,
  });

  final String url;
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final List projects;
  final List tasks;
  final List groups;

  User copyWith({
    required String url,
    required int id,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required List projects,
    required List tasks,
    required List groups,
  }) =>
      User(
        url: url ?? this.url,
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        projects: projects ??
            this.projects,
        tasks: tasks ??
            this.tasks,
        groups: groups ??
            this.groups,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json["url"] ?? kUsersUrl + json["pk"].toString(),
        id: json["id"] ?? json["pk"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        projects: json["projects"] ?? [],
        tasks: json["tasks"] ?? [],
        groups: json["group"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "projects": projects.toString(),
        "tasks": tasks.toString(),
        "group": groups.toString(),
      };
}
