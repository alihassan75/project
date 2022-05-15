// To parse this JSON data, do
//     final task = taskFromJson(jsonString);
import 'dart:collection';
import 'dart:core';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/auth_token.dart';
import 'package:project/model/user_Model.dart'; 
import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
//List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));
//String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  class Project {
  String? url;
  int? id;
  String? owner;
  String? title;
  String? created;
  List<String>? tasks;

  Project(
      {this.url, this.id, this.owner, this.title, this.created, this.tasks});

  Project.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    owner = json['owner'];
    title = json['title'];
    created = json['created'];
    tasks = json['tasks'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['title'] = this.title;
    data['created'] = this.created;
    data['tasks'] = this.tasks;
    return data;
  }
}
  class SharedPrefrence {
  Future<Future<bool>> setid(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("id", id);
  }

  Future<int> getid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("id")??0;
  }
}

class ProjectProvider with ChangeNotifier{
  ProjectProvider(){
    fetchProject();
  }

  List<Project> _project = [];
  List<Project> get project {
    return [..._project];
  }
  
    void addProject(Project project) async {
    //   String access;
    //  SharedPrefrences().getToken().then((data) async {
    //   access = data;
    final response = await http.post(Uri.parse('http://mostafahamed.pythonanywhere.com/projects/'),
        headers: {"Content-Type": "application/json",
        /*HttpHeaders.authorizationHeader: '$access'*/}, body: json.encode(project));
 
    if (response.statusCode == 201) {
     project.id = json.decode(response.body)['id'];
     //project.user = json.decode(response.body)['user'];
      /*project.user=User.id;*/
     //project.user = id;
    //  void upDateSharedPreferences(/*String token,*/ int id) async {
    //          SharedPreferences _prefs = await SharedPreferences.getInstance();
    //           //_prefs.setString('token', token);
    //         project.user=_prefs.getInt('id');
    //         }
            print('${project.owner} in sucess');
      
      _project.add(project);
      notifyListeners();
    print('sucess');
    //print(access);
    
    }
   else {
    // String token = access;
//print(User.email);
// Map<String, dynamic> payload = Jwt.parseJwt(token);
// DateTime? expiryDate = Jwt.getExpiryDate(token);
// bool isExpired = Jwt.isExpired(token);
//   print('is expired $isExpired');
// print(expiryDate);
//   print(payload);
//     print(access);
     print(response.body);
     print('${project.owner} in faild');
    throw Exception('Failed to add project');
  }
   // });
 }

  void deleteProject(Project project) async {
    final response =
        await http.delete(Uri.parse('http://mostafahamed.pythonanywhere.com/project/api${project.id}/'));
    if (response.statusCode == 204) {
      _project.remove(project);
      notifyListeners();
       print('sucess');
    }
   else {
   
    throw Exception('Failed to load tasks');
  }
  
  }



    fetchProject() async{
     final response = await http
      .get(Uri.parse('http://mostafahamed.pythonanywhere.com/projects/?format=json'));
    if (response.statusCode==200){
      var data = json.decode(response.body)/*as List*/;
     // _project=data.map<Project>((json) => Project.fromJson(json)).toList();
      _project=(data as List).map<Project>((json) => Project.fromJson(json)).toList();
     
      notifyListeners();
       print('sucess');
       print(response.body);
    }
   else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to load projects');
  }
  }
}