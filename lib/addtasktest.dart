import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/model/project_model.dart';
import 'package:project/model/task_model.dart';
// import 'package:project/task_View.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class addtesttask extends StatefulWidget {
  const addtesttask({Key? key}) : super(key: key);

  @override
  State<addtesttask> createState() => _addtesttaskState();
}

class _addtesttaskState extends State<addtesttask> {
  final TextEditingController _projectname = TextEditingController();
  TextEditingController datelController = TextEditingController();
  TextEditingController datelController2 = TextEditingController();
  TextEditingController Textcontroller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  //DateTime currentDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: currentDate,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2050));
  //   if (pickedDate != null && pickedDate != currentDate)
  //     setState(() {
  //       currentDate = pickedDate;
  //     });
  //     else print('empty')
  //     ;}
  void onAddd() {
    final DateTime? textVal = DateTime.parse(datelController.text);
    final DateTime? textVal2 = DateTime.parse(datelController2.text);
    final String? textVal3 = Textcontroller.text;
    final String desVal = _projectname.text;

    if (textVal != null && textVal2 != null && desVal.isNotEmpty) {
      final Task task = Task(
        end: textVal,
        title: desVal,
        /*id: null,*/ start: textVal2,
        /*owner: null,*/ desc: textVal3, /*project_id: null*/
      );
      Provider.of<TaskProvider>(context, listen: false).addTask(task);
    } else {
      print('empty or vaild');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar The upper part in the application
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
                      blurRadius: 20),
                ]),
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
                  controller: _projectname,
                  decoration: const InputDecoration(
                    hintText: "Enter project Name", //اليوسر يدخل اسم المشروع
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xffc9c9c9), /*height: 2.5*/
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF09679a))),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(43, 0, 43, 20),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: datelController,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    ).then((value) {
                      datelController.text =
                          DateFormat("yyyy-MM-dd").format(value!);
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "start Date",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xffc9c9c9),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF09679a))),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(43, 0, 43, 20),
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: datelController2,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    ).then((value) {
                      datelController2.text =
                          DateFormat("yyyy-MM-dd").format(value!);
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "End Date",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xffc9c9c9),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF09679a))),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
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

            Container(
              width: double.infinity,
              height: 54,
              margin: const EdgeInsets.fromLTRB(75, 0, 75, 0),
              child: ElevatedButton(
                onPressed: () {
                  onAddd();
                  //_selectDate(context);
                  //Navigator.of(context).pop();
                },
                child: const Text(
                  'Create',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF09679a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      // f... flutter buttons!
                      side: const BorderSide(color: Colors.black, width: 1),
                    )),
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
              ), //just text
            ),
            // Text(currentDate.toString()),
            // ElevatedButton(
            //   onPressed: () => _selectDate(context),
            //   child: Text('Select date'),
            // ),
            TextButton(
                onPressed: () {
                  // Navigator.push(
                  //       context, MaterialPageRoute(builder: (context) =>TaskListView()));
                },
                child: Text('task list'))
          ],
        ),
      ),
    );
  }
}
