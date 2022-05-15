// ignore_for_file: file_names

import 'dart:collection';

import 'package:flutter/foundation.dart';

class CheckList {
  final String name;
  bool isDone;

  CheckList({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

class TaskData extends ChangeNotifier {
  final List<CheckList> _suptasks = [
    // Task(name: 'Buy milk'),
    // Task(name: 'Buy eggs'),
    // Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<CheckList> get suptasks {
    return UnmodifiableListView(_suptasks);
  }

  int get taskCount {
    return _suptasks.length;
  }

  void addSupTask(String newTaskTitle) {
    _suptasks.add(CheckList(name: newTaskTitle));
    notifyListeners();
  }

  void updateSupTask(CheckList suptask) {
    suptask.toggleDone();
    notifyListeners();
  }

  void deleteSupTask(CheckList suptask) {
    _suptasks.remove(suptask);
    notifyListeners();
  }
}
