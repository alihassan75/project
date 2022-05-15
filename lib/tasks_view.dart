// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/project.dart';
import 'package:project/models/task.dart';

import 'services/middleware.dart';

class TasksView extends StatefulWidget {
  final Project project;
  TasksView({required this.project});
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final ApiService _api = ApiService();

  @override
  Widget build(BuildContext context) {
    final Project _project = widget.project;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: const Color(0xff94adb4),
            height: 2,
            width: 320,
          ),
          preferredSize: const Size.fromHeight(4.0),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff076792),
        title: Text(
          _project.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(color: Color(0xa6A2B6D4), blurRadius: 20),
            ],
          ),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 6, 3),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.search,
                size: 44,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Task>>(
        future: _api.getTasks(_project.tasks),
        builder: (context, snapshot) {
          if (snapshot.hasError) Text("Error happened ${snapshot.error}");
          if (!snapshot.hasData) {
            print('on null trying fetch data  ${snapshot.data}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              print("wating to load data");
              Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              AsyncSnapshot.waiting();
              TaskList(
                tasks: snapshot.data as List<Task>,
                id: _project.id,
                title: _project.title,
              );
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
          }
          return snapshot.hasData
              ? TaskList(
                  tasks: snapshot.data!,
                  id: _project.id,
                  title: _project.title,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final int id;
  final String title;
  TaskList({
    Key? key,
    required this.tasks,
    required this.id,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 10, 8),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff076792),
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        // dynamic list
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              Task _task = tasks[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(
                  28,
                  12,
                  28,
                  0,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => projectDetails()));
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                        18,
                        8,
                        9,
                        4,
                      ),
                      width: 100,
                      height: 100,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Starting ' +
                                    DateFormat.yMMMMEEEEd().format(
                                      _task.start,
                                    ),
                                style: const TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    133,
                                    186,
                                    202,
                                  ),
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
                                _task.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Ending ' +
                                    DateFormat.yMMMMEEEEd().format(
                                      _task.end,
                                    ),
                                style: const TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    133,
                                    186,
                                    202,
                                  ),
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
            },
          ),
        ),
      ],
    );
  }
}
