// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/helpers/constants.dart';

class ContactUsScreen extends StatelessWidget {
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
          'Contact Us',
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'flu',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Color(0xa6A2B6D4), blurRadius: 20),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Do you have any problems?\n"
                "Do you want to contact us about something?\n"
                "You can contact us through our following pages:",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  wordSpacing: 1,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      //make border radius more than 50% of square height & width
                      child: Image.asset(
                        kFacebook,
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Facebook',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff0981b6),
                      ),
                    ),
                    onPressed: () {
                      print("Opens Facebook Page");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      //make border radius more than 50% of square height & width
                      child: Image.asset(
                        kTwitter,
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Twitter',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff0981b6),
                      ),
                    ),
                    onPressed: () {
                      print("Opens Twitter Page");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      //make border radius more than 50% of square height & width
                      child: Image.asset(
                        kLinked,
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'LinkedIn',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff0981b6),
                      ),
                    ),
                    onPressed: () {
                      print("Opens LinkedIn Page");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 180,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                    top: 33,
                  ),
                  child: const Text(
                    'M Task 1.0.0.0', //just v number
                    style: TextStyle(color: Colors.teal, fontSize: 9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
