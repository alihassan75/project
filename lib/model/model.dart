// // To parse this JSON data, do
// //
// //     final project = projectFromJson(jsonString);

// import 'dart:convert';

// List<Project> projectFromJson(String str) => List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

// String projectToJson(List<Project> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Project {
//   Project({
//      required this.id,
//     required this.projectName,
//     required this.createdAt,
//     required this.user,
//   });

//   int id;
//   String projectName;
//   DateTime createdAt;
//   int user;

//   factory Project.fromJson(Map<String, dynamic> json) => Project(
//     id: json["id"],
//     projectName: json["project_name"],
//     createdAt: DateTime.parse(json["created_at"]),
//     user: json["user"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "project_name": projectName,
//     "created_at": createdAt.toIso8601String(),
//     "user": user,
//   };
// }
