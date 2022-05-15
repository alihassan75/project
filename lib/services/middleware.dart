// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:project/helpers/constants.dart';
import 'package:project/services/sharedPrefs.dart';

import '../models/project.dart';
import '../models/user.dart';
import '../models/task.dart';
import '../models/group.dart';
import 'package:http/http.dart' as http;

///* API Service for handling middleware
class ApiService {
  final SharedPrefsUtils _prefs = SharedPrefsUtils.getInstance();

  ///* Function made to login existing users
  Future<bool> loginUser(
    String username,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(kLoginUsers),
      body: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.

      String _token = jsonDecode(response.body)["key"];
      await _prefs.saveData("token", "Token $_token");
      return true;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to login user');
    }
  }

  ///* Function made to logout existing users
  Future<bool> logoutUser() async {
    String _token = _prefs.getData("token");
    final response = await http.post(
      Uri.parse(kLogoutUsers),
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      await _prefs.clearData("token");
      return true;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to logout user');
    }
  }

  ///* Function made to fetch tasks
  Future<List<Task>> getTasks(List tasks) async {
    List<String> _urls = tasks
        .map(
          (e) => e.toString(),
        )
        .toList();
    List<Task> _list = [];
    try {
      for (String url in _urls) {
        Task _singleTask = await fetchTask(url);
        _list.add(_singleTask);
      }

      print(_list.length);

      /// If the server did return a 200 OK response,
      /// then parse the JSON.

      return _list;
    } catch (e) {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      print(
        e.toString(),
      );
      throw Exception('Failed to get tasks');
    }
  }

  ///* Function made to create projects
  Future<bool> createProject(String name, DateTime endDate) async {
    String _token = _prefs.getData("token");
    final response = await http.post(
      Uri.parse(kProjectsUrl),
      body: {
        "title": name,
      },
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 201) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.

      return true;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to create project');
    }
  }

  ///* Function made to delete projects
  Future<bool> deleteProject(Project project) async {
    String _token = _prefs.getData("token");
    final response = await http.delete(
      Uri.parse(project.url),
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 204) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.

      return true;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to delete project');
    }
  }

  ///* Function made to reset user's password
  Future<bool> resetPass(
    String username,
    String pass,
    String passConfirm,
  ) async {
    final response = await http.post(
      Uri.parse(kResetPass),
      body: {
        "new_password1": pass,
        "new_password2": passConfirm,
        "username": username,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      return true;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      print(response.reasonPhrase);
      throw Exception('Failed to logout user');
    }
  }

  ///* Function made to sign new users up
  Future<User> signupUser(
    String username,
    String firstName,
    String lastName,
    String password,
    String email,
  ) async {
    final response = await http.post(
      Uri.parse(kUsersUrl),
      body: {
        "username": username,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "email": email
      },
    );

    if (response.statusCode == 201) {
      /// If the server did return a 201 Created response,
      /// then parse the JSON.
      return User.fromRawJson(response.body);
    } else {
      /// If the server did not return a 201 Created response,
      /// then throw an exception.
      throw Exception('Failed to signup user');
    }
  }

  ///* Function made to retrieve logged user's data
  Future<User> fetchUserData() async {
    String _token = _prefs.getData("token");

    final response = await http.get(
      Uri.parse(kUserData),
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      final User _user = await fetchUser(
        kUsersUrl + jsonDecode(response.body)["pk"].toString(),
      );
      return _user;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception("Failed to load user's data");
    }
  }

  ///* Function made to retrieve one task per url
  Future<Task> fetchTask(String url) async {
    String _token = _prefs.getData("token");

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      return Task.fromRawJson(response.body);
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception('Failed to load task');
    }
  }

  ///* Function made to retrieve one project per url
  Future<Project> fetchProject(String url) async {
    String _token = _prefs.getData("token");

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      return Project.fromRawJson(response.body);
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception('Failed to load project');
    }
  }

  ///* Function made to retrieve one user per url
  Future<User> fetchUser(String url) async {
    String _token = _prefs.getData("token");

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": _token,
      },
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      return User.fromRawJson(response.body);
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception('Failed to load types');
    }
  }

  ///* Function made to retrieve one group per url
  Future<Group> fetchGroup(String url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      return Group.fromRawJson(response.body);
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception('Failed to load types');
    }
  }
}
