// import 'dart:collection';
// import 'dart:core';
// import 'package:flutter/foundation.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:project/screens/sign_up.dart';
// //import 'package:project/model/project_model.dart';

// import 'dart:async';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';

// class User {
  
//   final int id;
//   final String username;
//   final String email;
 
//  //final String access;
//  //final String refresh;

//   User({ required this.id, required this.username, required this.email, /*required this.access, required this.refresh*/});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//         id: json['id'],
//         username: json['name'],
//         email: json['email'],
//        // access: responseData['access'],  
//        // refresh: responseData['refresh']
//     );
//   }
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "email": email,
//     //"access": access,
//     //"refresh": refresh,
//   };
// //   void storeUserData(User user){
// //     int id=0;
// //     String username='';
// //     String email='';
// //      sharePrefenceuser().getuser(id,username,email).then((data) async {
// //       id = data as int ;
// //       username = data as String ;
// //       email = data as String ;
// //       User.id = id as String;
// //       User.username = username;
// //       User.email = email ;
// //       });
// // }
// }
