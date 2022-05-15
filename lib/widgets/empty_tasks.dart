import 'package:flutter/material.dart';

import '../screens/add_task_screen.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 50.0,
            right: 20.0,
            top: 40.0,
          ),
          child: const Text(
            'You Don\'t Have \n Any Tasks',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
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
          width: double.infinity,
          height: 54,
          margin: const EdgeInsets.fromLTRB(75, 40, 75, 0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddTask(),
                ),
              );
            },
            child: const Text(
              'Add Tasks',
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
      ],
    );
  }
}
