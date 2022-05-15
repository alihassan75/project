// ignore_for_file: use_key_in_widget_constructors // TODO: `AddTask` screen

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/screens/addWork_screen.dart';

// import '../task_View.dart';

class AddTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTask();
  }
}

class _AddTask extends State<AddTask> {
  TextEditingController startTimeCtl = TextEditingController();
  TextEditingController endTimeCtl = TextEditingController();
  TextEditingController Textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff076792),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30.0,
        ),
        title: const Center(
          child: Text(
            'Project1',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      color: Color(0xa6A2B6D4),
                      offset: Offset(7, 5),
                      blurRadius: 20),
                ]),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff076792),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 22.0, horizontal: 10.0),
                    hintText: "",
                    labelText: 'Task Name',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xffc9c9c9),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff076792),
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                controller: Textcontroller,
                // style: const TextStyle(
                //   height: 5,
                // ),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
                  labelText: 'Task Note',
                  hintText: "",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xffc9c9c9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        width: 2,
                        color: Color(0xff076792),
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                        ),
                        width: 150,
                        height: 70,
                        child: TextField(
                          controller: startTimeCtl,
                          //editing controller of this TextField
                          decoration: const InputDecoration(
                            //icon of text field
                            labelText: "Start Time",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xffc9c9c9),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff076792),
                                style: BorderStyle.solid,
                              ),
                            ), //label text of field
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              print(
                                  pickedTime.format(context)); //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              print(
                                  parsedTime); //output 1970-01-01 22:53:00.000
                              String formattedTime =
                                  DateFormat('HH:mm').format(parsedTime);
                              print(formattedTime); //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                              setState(() {
                                startTimeCtl.text =
                                    formattedTime; //set the value of text field.
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        width: 150,
                        height: 70,
                        child: TextField(
                          controller: endTimeCtl,
                          //editing controller of this TextField
                          decoration: const InputDecoration(
                            //icon of text field
                            labelText: "End Time",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xffc9c9c9),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff076792),
                                style: BorderStyle.solid,
                              ),
                            ), //label text of field
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              print(
                                  pickedTime.format(context)); //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              print(
                                  parsedTime); //output 1970-01-01 22:53:00.000
                              String formattedTime =
                                  DateFormat('HH:mm').format(parsedTime);
                              print(formattedTime); //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                              setState(() {
                                endTimeCtl.text =
                                    formattedTime; //set the value of text field.
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      // MaterialPageRoute(builder: (context) => TaskListView()));
                    },
                    child: const Text(
                      'Next',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 50),
                        primary: const Color(0xff076792),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.black, width: 1),
                        )),
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
