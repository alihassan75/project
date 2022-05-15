import 'package:flutter/material.dart';
import 'package:project/model/addWork_data.dart';
import 'package:provider/provider.dart';

class AddWorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Work',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addSupTask(newTaskTitle);
                Navigator.pop(context);
              },
              color: Colors.blue,
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              textColor: Colors.white,
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
