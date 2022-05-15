// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/services/middleware.dart';

class NewProject extends StatefulWidget {
  const NewProject({Key? key}) : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  final TextEditingController projectName = TextEditingController();
  final ApiService _api = ApiService();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var date = (DateFormat.yMMMMEEEEd().format(
              selectedDate,
            ) ==
            DateFormat.yMMMMEEEEd().format(
              DateTime.now(),
            ))
        ? "today"
        : DateFormat.yMMMMEEEEd().format(
            selectedDate,
          );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff076792),
        title: const Padding(
          padding: EdgeInsets.only(
            left: 50.0,
          ),
          // project Name
          child: Text(
            'New Project',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
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
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 30.0,
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 80.0),
                child: Text(
                  'Creating New Project',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xff076792),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(43, 24, 43, 15),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: projectName,
                  decoration: const InputDecoration(
                    hintText: "Enter project Name", //اليوسر يدخل اسم المشروع
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xffc9c9c9),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xFF09679a),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(43, 0, 43, 20),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  child: Text(
                    "Selected date is " + date,
                  ),
                  onPressed: () async {
                    DateTime _selected = (await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    ))!;
                    setState(() {
                      selectedDate = _selected;
                    });
                    print(selectedDate);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              height: 54,
              margin: const EdgeInsets.symmetric(
                horizontal: 75,
                vertical: 0,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  late bool result;
                  if (projectName.text.isNotEmpty) {
                    result = await _api.createProject(
                      projectName.text,
                      selectedDate,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Enter Project name"),
                      ),
                    );
                  }
                  result
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Created successfully"),
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Couldn't be created"),
                          ),
                        );
                  Navigator.pop(context, true);
                  setState(() {});
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF09679a),
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
              child: const Padding(
                padding: EdgeInsets.only(left: 60, top: 15.0, right: 60.0),
                child: Text(
                  'By Creating This Project You Will Be Admin Of The Project',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
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
