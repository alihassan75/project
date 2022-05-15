// ignore_for_file: use_key_in_widgetructors, preferructors, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/sign_in.dart';
import '../models/user.dart';
import '../helpers/constants.dart';
import '../services/middleware.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ApiService _api = ApiService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNController = TextEditingController();
  TextEditingController lastNController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///* Logo and app name
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 8, 20),
                      child: Image.asset(
                        kLogo,
                        width: 64,
                        height: 64,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 10, 5, 20),
                      child: Text(
                        'M Task',
                        style: TextStyle(
                          color: Color(0xff076792),
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          // ignore: prefer_const_literals_to_create_immutables
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
                  ],
                ),
              ),

              ///* Welcome statement
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Welcome to M Task.',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff076792),
                  ),
                ),
              ),

              ///* Welcome paragraph
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30.0),
              //   child: Text(
              //     "Are you distracted Don't know where to start?\n"
              //     "Do you want to organize your work for you and your friend? "
              //     "Hi you are in the right place.",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff076792),
              //     ),
              //   ),
              // ),

              ///* Divider
              // Center(
              //   child: Divider(
              //     height: 15,
              //     thickness: 1.5,
              //     indent: 25,
              //     endIndent: 25,
              //     color: Color(0xff076792),
              //   ),
              // ),

              ///* Permission statement
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30.0),
              //   child: Text(
              //     'We Will Use Your Email For Password Confirmation!',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff076792),
              //     ),
              //   ),
              // ),

              ///* Username
              Container(
                margin: EdgeInsets.fromLTRB(43, 30, 43, 0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* First Name
              Container(
                margin: EdgeInsets.fromLTRB(43, 15, 43, 0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: firstNController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* Last Name
              Container(
                margin: EdgeInsets.fromLTRB(43, 15, 43, 0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: lastNController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* Email
              Container(
                margin: EdgeInsets.fromLTRB(43, 15, 43, 0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* Password
              Container(
                margin: EdgeInsets.fromLTRB(43, 15, 43, 0),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* Confirm Password
              Container(
                margin: EdgeInsets.fromLTRB(43, 15, 43, 10),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: confirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* SignUp Button
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      String username = usernameController.text;
                      String firstName = firstNController.text;
                      String lastName = lastNController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String confirmPass = confirmPassController.text;
                      if (password == confirmPass) {
                        User user = await _api.signupUser(
                          username,
                          firstName,
                          lastName,
                          password,
                          email,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            dismissDirection: DismissDirection.none,
                            backgroundColor: Colors.green,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Signed up successfully\n"
                                  "Username is ${user.username}\n"
                                  "Waiting for redirection",
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ),
                          ),
                        );

                        await Future.delayed(
                          Duration(seconds: 4),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else if (confirmPass != password) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Confirmed password and password don't match",
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff076792),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///* Signin Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              ///* Version
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 33, 0, 0),
                child: Text(
                  'M Task 1.0.0.0',
                  style: TextStyle(color: Colors.teal, fontSize: 9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
