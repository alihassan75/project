// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff076792),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30.0,
        ),
        title: const Text(
          'About',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'flu',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color(0xa6A2B6D4),
                blurRadius: 20,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to the M Task app. "
              "We are a group of developers. "
              "We developed this application for our graduation project, "
              "as we built it from scratch with all its details under the supervision of Dr. Ahmed Bayoumi. "
              "The goal of this application is to manage tasks and projects in general by dividing and clarifying them. "
              "The application also allows project management with a group of users at one time. "
              "For more details, you can contact us through the following links:",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 21.2,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(kFacebook),
                    iconSize: 50.0,
                    onPressed: () {
                      print("Opens FB Page");
                    },
                  ),
                  IconButton(
                    icon: Image.asset(kTwitter),
                    iconSize: 50.0,
                    onPressed: () {
                      print("Opens Twitter Account");
                    },
                  ),
                  IconButton(
                    icon: Image.asset(kLinked),
                    iconSize: 50.0,
                    onPressed: () {
                      print("Opens LinkedIn Account");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
