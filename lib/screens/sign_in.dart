// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/screens/forget_password.dart';
import 'package:project/screens/home.dart';
import 'package:project/services/middleware.dart';
import '../helpers/constants.dart';
import 'contact_us_screen.dart';

/// صفحة تسجيل الدخول
class SignIn extends StatefulWidget {
  //const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final ApiService _api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 33, 5, 20),
                child: Center(
                  child: Image.asset(
                    kLogo,
                    width: 64,
                    height: 64,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(7, 26, 5, 20),
                child: Text(
                  'M Task', //اسم البرنامج الحالي
                  style: TextStyle(
                    color: Color(0xff076792),
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
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
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 20),
            child: const Text(
              /// جملة الترحيب
              'Welcome Back',
              style: TextStyle(
                color: Color(0xff076792),
                fontSize: 38,
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(0.1, 0.1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(43, 33, 43, 0),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                controller: usernamecontroller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 6.0, top: 8),
                  prefixIcon: Icon(Icons.account_circle),
                  //هنا المستخدم يدخل اسم المستخدم
                  hintText: "User Name",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xffc9c9c9),
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
          Container(
            margin: const EdgeInsets.fromLTRB(43, 24, 43, 0),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.only(left: 6.0, top: 8),
                  //اليوسر يدخل الباص هنا
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xffc9c9c9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xff076792),
                    ),
                  ),
                ),

                /// الكلام بيتكتب مشفر ستارز
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 4,
            ),
            child: TextButton(
              child: const Text(
                'Forget Your Password?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPassword(),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 54,
            margin: const EdgeInsets.symmetric(
              horizontal: 75,
              vertical: 0,
            ),
            child: ElevatedButton(
              onPressed: () async {
                bool result = await _api.loginUser(
                  usernamecontroller.text,
                  passwordcontroller.text,
                );
                if (result) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      dismissDirection: DismissDirection.none,
                      backgroundColor: Colors.green,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Logged in successfully\n"
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
                      builder: (_) => HomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Error Happened"),
                    ),
                  );
                }
              },
              child: const Text(
                /// زرار تسجيل الدخول
                'Sign In',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff076792),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: const Text('Do you have any problem?'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 1,
            ),
            child: TextButton(
              child: const Text(
                'Contact Us',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 60,
            ),
            child: const Text(
              'M Task 1.0.0.0', //just v number
              style: TextStyle(
                color: Colors.teal,
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
