// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/sign_in.dart';
import 'package:project/screens/sign_up.dart';

import '../helpers/constants.dart';
import 'contact_us_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 5, 20),
                    child: Center(
                      child: Image.asset(
                        kLogo,
                        width: 64,
                        height: 64,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(7, 10, 5, 20),
                    child: Text(
                      'M Task',
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
            ),
            Image.asset(
              'assets/images/image.png',
              width: 300,
            ),
            Container(
              width: double.infinity,
              height: 54,
              margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                child: const Text(
                  'Sign Up',
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
              width: double.infinity,
              height: 54,
              margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                child: const Text(
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
            const Text('Do you have any problem?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ),
                );
              },
              child: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: const Text(
                'M Task 1.0.0.0', //just v number
                style: TextStyle(color: Colors.teal, fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
