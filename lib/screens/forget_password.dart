// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/change_pass.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff076792),
        title: const Text(
          'Forget Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'flu',
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
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(43, 80, 43, 80),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
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
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePass(),
                    ),
                  );
                },
                child: const Text(
                  'Send Code',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
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
              height: 50,
              margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
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
          ],
        ),
      ),
    );
  }
}
