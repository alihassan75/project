import 'package:flutter/material.dart';
import 'package:project/model/addWork_data.dart';
import 'package:provider/provider.dart';

class checkListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final suptasks = taskData.suptasks[index];
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 1),
                  child: Card(
                    shadowColor: const Color(0xff076792),
                    elevation: 1,
                    child: TaskTile(
                      taskTitle: suptasks.name,
                      isChecked: suptasks.isDone,
                      checkboxCallback: (bool? checkboxState) {
                        taskData.updateSupTask(suptasks);
                      },
                      longPressCallback: () {
                        taskData.deleteSupTask(suptasks);
                      },
                    ),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xff076792), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final dynamic checkboxCallback;
  final dynamic longPressCallback;

  // dynamic checkboxCallback(bool? checkboxState) {
  //   setState(() {
  //     isChecked = checkboxState!;
  //   });
  // }

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      trailing: MaterialButton(
          onPressed: longPressCallback,
          child: const Icon(
            Icons.delete,
            color: Color(0xff076792),
          )),
    );
  }
}
