// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/project.dart';
import 'package:project/models/user.dart';
import 'package:project/screens/single_project_view.dart';
import 'package:project/services/middleware.dart';

import '../tasks_view.dart';

class ProjectsView extends StatefulWidget {
  final List<dynamic> projects;
  final User user;
  const ProjectsView({
    Key? key,
    required this.projects,
    required this.user,
  }) : super(key: key);

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  List<String> _projectsUrls = [];
  final ApiService _api = ApiService();

  @override
  Widget build(BuildContext context) {
    _projectsUrls = widget.projects
        .map(
          (e) => e.toString(),
        )
        .toList();
    final User _user = widget.user;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _projectsUrls.length,
      itemBuilder: (context, index) {
        return FutureBuilder<Project>(
          future: _api.fetchProject(
            _projectsUrls[index],
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Project _project = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.fromLTRB(28, 12, 28, 0),
                child: GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SingleProjectView(
                          project: _project,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(18, 8, 9, 4),
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.0),
                        color: const Color(0xff076792),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color(0xa6A2B6D4),
                            offset: Offset(7, 5),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Project ID: ${_project.id}",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                height: 16.0,
                                width: 16.0,
                              ),
                              Text(
                                (_project.owner == _user.username)
                                    ? "Admin"
                                    : "Member",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _project.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat.yMMMMEEEEd().format(
                                  _project.created,
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error Happened"),
              );
            }
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
