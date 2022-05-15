import 'package:flutter/material.dart';
import 'package:project/model/addWork_data.dart';
import 'package:project/model/checkList.dart';
import 'package:project/supScreens/add_work_screen.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class workChickList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff076792),
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
        title: const Text(
          'Task 1',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'flu',
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(color: Color(0xa6A2B6D4), blurRadius: 20),
              ]),
        ),
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),

              itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Complete Task'),
              ),
              const PopupMenuDivider(
                height: 1,
              ),
              const PopupMenuItem<int>(
                  value: 1, child: Text('Edit Task')),
              const PopupMenuDivider(
                height: 1,
              ),
              const PopupMenuItem<int>(
                  value: 2, child: Text('Leave Task')),
              const PopupMenuDivider(
                height: 1,
              ),
              const PopupMenuItem<int>(
                  value: 3, child: Text('Delete Task')),
            ]),],



      ),      
      //backgroundColor: Colors.blue[50],
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.fromLTRB(1,1,1,1),
      //   child: FloatingActionButton(
      //     backgroundColor: const Color(0xff076792),
      //     onPressed: () {
      //       showModalBottomSheet(
      //         context: context,
      //         isScrollControlled: true,
      //         builder: (context) => SingleChildScrollView(
      //           child: Container(
      //             padding: EdgeInsets.only(
      //                 bottom: MediaQuery.of(context).viewInsets.bottom),
      //             child: AddWorkScreen(),
      //           ),
      //         ),
      //       );
      //     },
      //     child: const Icon(Icons.add),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                            const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 0.0,
              ),
              child: Text(
                'Task 1',
                style: TextStyle(
                  color: Color(0xff076792),
                  fontSize: 50,
                  fontFamily: 'se',
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Ending : ',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Text(
                  '00/00/0000',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'This task will be specific \n to some project Diagrams',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff076792),
                    ),
                  ),
                ),
              ],
            ),
                        Center(
                child:Container(
                  width:315,
                  height: 60,
                  child:  Card(
                        shadowColor: const Color(0xff076792),
                        shape:  const RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xff076792), width: 1),      
                        ),
                        child: Row(
                          children:  [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Center(
                                child: Text(
                                  'Task Work Space',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                             Padding(
        padding: const EdgeInsets.fromLTRB(36,1,1,1),
        child: FloatingActionButton(mini: true,
          backgroundColor: const Color(0xff076792),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => Scrollbar(
                isAlwaysShown:true,
                child: ListView(
                  children: 
                    [Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddWorkScreen(),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
                          ],
                        ),
                      ),
                  ),
                ),
            
              Center(
                child: Container(height: 300,width: 305,
                
                  child: checkListView(),
                  decoration:  BoxDecoration(
                    color: Colors.white, 
                    border: Border.all(color: const Color(0xff076792), width: 1),
                  ),
                ),
              ),
            
                        Center(
                child:Container(
                  width:315,
                  height: 50,
                  child:  Card(color: Color(0xff076792),
                        shadowColor: const Color(0xff076792),
                        shape:  const RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xff076792), width: 1),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async{
                                var picked = await FilePicker.platform.pickFiles();
                                if (picked != null) {
                           print(picked.files.first.name);
                           //File file = File(result.files.single.path);
                         }
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 100,top: 0,bottom: 2),
                                child: Text(
                                  'Upload File',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                       onPressed: () async{
                         var picked = await FilePicker.platform.pickFiles();
                         
                         if (picked != null) {
                           print(picked.files.first.name);
                           //File file = File(result.files.single.path);
                         }
                       },
                       icon: const Icon(
                         Icons.attach_file,
                         color: Color.fromARGB(255, 255, 255, 255),
                       ),
                      ),
                          ],
                        ),
                      ),
                  ),
                ),
          ],
          
        ),
      ),
    );

  }
  onSelected(BuildContext context, Object? item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => workChickList()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => workChickList()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => workChickList()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => workChickList()),
        );
        break;
  }
  }
}
