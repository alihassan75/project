// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/models/project.dart';
import 'package:project/services/middleware.dart';
import 'package:project/widgets/empty_groups.dart';
import '../tasks_view.dart';
import '../widgets/empty_tasks.dart';
import 'AddMember.dart';
import 'add_task_screen.dart';

class SingleProjectView extends StatefulWidget {
  final Project project;
  SingleProjectView({
    required this.project,
  });
  @override
  State<SingleProjectView> createState() => _ProjectState();
}

class _ProjectState extends State<SingleProjectView> {
  onSelected(BuildContext context, int item) async {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddTask(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddMember(),
          ),
        );
        break;
      case 2:
        bool res = (await showDialog<bool>(
          context: context,
          builder: (context) {
            final Project _project = widget.project;
            final ApiService _api = ApiService();

            return AlertDialog(
              title: Text(
                "Delete project",
              ),
              content: Text(
                "Are you sure about deleting ${_project.title}?\n"
                "These changes can't be undone once you click on \"Yes\" button..",
              ),
              actions: [
                TextButton.icon(
                  onPressed: () async {
                    bool res = await _api.deleteProject(_project);
                    res ? Navigator.pop(context, true) : setState(() {});
                    res ? setState(() {}) : setState(() {});
                  },
                  icon: Icon(Icons.delete),
                  label: Text("Yes"),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text("No"),
                ),
              ],
            );
          },
        ))!;
        res ? Navigator.pop(context) : setState(() {});
        res ? setState(() {}) : setState(() {});
        setState(() {});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Project _project = widget.project;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff076792),
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            _project.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              shadows: [
                Shadow(
                  color: Color(0xa6A2B6D4),
                  offset: Offset(7, 5),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
        actions: [
          // icon Search
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton<int>(
            onSelected: (int item) => onSelected(context, item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Add Tasks'),
              ),
              const PopupMenuDivider(
                height: 1,
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Edit Members'),
              ),
              const PopupMenuDivider(
                height: 1,
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Delete Project'),
              ),
            ],
          ),
        ],
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                _project.title,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff076792),
                ),
              ),
            ),
            _project.groups.isEmpty
                ? NoGroupsWidget()
                : ElevatedButton(
                    onPressed: () {},
                    child: Text("View group"),
                  ),
            SizedBox(
              height: 50,
            ),
            _project.tasks.isEmpty
                ? NoTasksWidget()
                : ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TasksView(project: _project),
                        ),
                      );
                    },
                    child: Text("View tasks"),
                  ),
          ],
        ),
      ),
    );
  }
}
