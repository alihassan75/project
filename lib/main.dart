import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get_storage/get_storage.dart';

import 'package:project/model/project_model.dart';
import 'package:project/model/task_model.dart';

import 'package:flutter/services.dart'; // landscape off
import 'package:project/screens/home.dart';
import 'package:project/screens/profile_screen.dart';
import 'package:project/tasks_view.dart';
// import 'package:project/screens/AddMember.dart';
// import 'package:project/screens/addWork_screen.dart';
// import 'package:project/screens/creat_project.dart';
// import 'package:project/screens/edit_member.dart';
// import 'package:project/screens/onboarding_screens.dart';
// import 'package:project/screens/project.dart';
// import 'package:project/screens/project_dtetailForTest.dart';
// import 'package:project/sing_up_alkilany.dart';
// import 'package:project/supScreens/add_work_screen.dart';
// import 'package:project/task_View.dart';
// import 'package:project/tasksById.dart';
// import 'package:project/timetest.dart';
import 'package:provider/provider.dart';
import 'model/addWork_data.dart';

import 'screens/onboarding_screens.dart';
import 'services/sharedPrefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await SharedPrefsUtils.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  // landscape off
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider<ProjectProvider>(
          create: (context) => ProjectProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (_, child) => Portal(child: child!),
        title: 'M Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
