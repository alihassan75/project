// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);
import 'dart:collection';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/project_model.dart';
import 'package:project/tasks_view.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

//List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

//String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  String? url;
  int? id;
  String? owner;
  String? project;
  String? title;
  DateTime? start;
  DateTime? end;
  String? desc;
  int? project_id;

  Task(
      {this.url,
      this.id,
      this.owner,
      this.project,
      this.title,
      this.start,
      this.end,
      this.desc,
      this.project_id});

  
  factory Task.fromJson(Map<String, dynamic> json) => Task(
    url :json["url"],
    id: json["id"],
    owner: json["owner"],
    project: json["project"],
    title: json["title"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    desc: json["desc"],
    project_id: json["project_id"],
    
    
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "id": id,
    "owner": owner,
    "project": project, 
    "title": title,
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
    "desc": desc,
    "project_id": project_id,
  };
}
  class SharedProojectId {
  Future<Future<bool>> setid(int? newId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("project_id", newId!);
  }

  Future<int> getid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("project_id")??0;
  }
}
class TaskProvider with ChangeNotifier{
     
  TaskProvider(){
    int project_id;
     SharedProojectId().getid().then((data) async {
      project_id = data;
      
    //  SharedProojectId().getid()as int;
     //TaskById(project_id: 1 /*widget.project_id*/, titleP: '',).project_id;
     print('coming id is $project_id');
     await this.fetchTask(project_id);

     });
  }
  

  List<Task> _task = [];
  List<Task> get task {
    return [..._task];
  }

    void addTask(Task task) async {
    final response = await http.post(Uri.parse('http://mostafahamed.pythonanywhere.com/project/task'),
        headers: {"Content-Type": "application/json"}, body: json.encode(task));
    if (response.statusCode == 201) {
      task.id = json.decode(response.body)['id'];
      _task.add(task);
      notifyListeners();
      print('suceeed add ed task');
      print(response.body);
    }else{
      print(response.body);
       print('failed add ed task');
    }
  }

  void deleteTask(Task task) async {
    final response =
        await http.delete(Uri.parse('http://mostafahamed.pythonanywhere.com/project/task${task.id}/'));
    if (response.statusCode == 204) {
      _task.remove(task);
      notifyListeners();
    }
  }


     Stream<List<Task>> fetchTask(/*[project_id]*/prpject_id) async*{
     final response = await http
      .get(Uri.parse('http://mostafahamed.pythonanywhere.com/tasks/?format=json'));
    if (response.statusCode==200){
      var data = json.decode(response.body)as List;
      // _task=data.map<Task>((json) => Task.fromJson(json)).toList();
      await Future.delayed(Duration(seconds:4));
      _task=data.map<Task>((json) => Task.fromJson(json))
      .where((task) => task.project_id == prpject_id ).toList();
      notifyListeners();
       print('sucess view task list');
       //print(response.body);
       print('$prpject_id in sucess');
       yield _task;
    }
   else {
     print(response.body);
     print(response.statusCode);
     print('$prpject_id in faild');
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load tasks');
    
  }
  }
}