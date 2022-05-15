// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:project/widgets/drawer.dart';

import '../models/user.dart';
import '../services/middleware.dart';
import '../services/sharedPrefs.dart';
import 'create_project.dart';
import 'projects_view.dart';

class HomePage extends StatefulWidget {
  ///* Homescreen
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SharedPrefsUtils _prefs = SharedPrefsUtils.getInstance();
  final ApiService _api = ApiService();
  Future<void> saveTaskID(int id) async {
    await _prefs.saveData("project_id", id);
    print(
      "new share value ${_prefs.getData("project_id")}",
    );
  }

  @override
  Widget build(BuildContext context) {
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
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: const Color(0xff076792),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(color: Color(0xa6A2B6D4), blurRadius: 20),
            ],
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(7),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 20, 10, 8),
                    child: Text(
                      'My Projects:',
                      style: TextStyle(
                        color: Color(0xff076792),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 12, 0, 0),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xff076792),
                      onPressed: () async {
                        bool res = (await Navigator.push<bool>(
                          context,
                          MaterialPageRoute<bool>(
                            builder: (context) => NewProject(),
                          ),
                        ))!;
                        res ? setState(() {}) : setState(() {});
                      },
                      child: const Icon(Icons.add),
                      shape: const StadiumBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<User>(
              stream: _api.fetchUserData().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final User _user = snapshot.data!;
                  if (_user.projects.isNotEmpty) {
                    return ProjectsView(
                      projects: _user.projects,
                      user: _user,
                    );
                  } else if (_user.projects.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60.0,
                        ),
                        const Text(
                          "You Don\'t Have Any Projects Yet.",
                          style: TextStyle(
                            fontSize: 27,
                          ),
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                        const Text(
                          'Add Project:',
                          style: TextStyle(
                            fontSize: 47,
                            color: Color(0xff076792),
                          ),
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                        Center(
                          child: FloatingActionButton(
                            backgroundColor: const Color(0xff076792),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewProject(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text("Error Happened");
                }

                return Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
