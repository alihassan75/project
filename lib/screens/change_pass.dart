// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'home.dart';

class ChangePass extends StatelessWidget {
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
                  Shadow(color: Color(0xa6A2B6D4), blurRadius: 20),
                ]),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(43, 33, 43, 0),
                child: const SizedBox(
                  height: 45,
                  child: TextField(
                    //maxLines: null,..
                    //expands: true,..
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Config Code",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9), /*height: 2.5*/
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff076792))),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Didn\'t Receive Code?',
                    style: TextStyle(
                      color: Colors.indigo,
                      decoration: TextDecoration.underline,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(43, 15, 43, 0),
                child: const SizedBox(
                  height: 45,
                  child: TextField(
                    //maxLines: null,..
                    //expands: true,..
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter New Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9), /*height: 2.5*/
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff076792))),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(43, 33, 43, 10),
                child: const SizedBox(
                  height: 45,
                  child: TextField(
                    //maxLines: null,..
                    //expands: true,..
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Confirm New Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xffc9c9c9), /*height: 2.5*/
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff076792))),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Save Change',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff076792),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // f... flutter buttons!
                        side: const BorderSide(color: Colors.black, width: 1),
                      )),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff076792),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // f... flutter buttons!
                        side: const BorderSide(color: Colors.black, width: 1),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
