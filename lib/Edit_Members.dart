import 'package:flutter/material.dart';
import 'package:project/screens/home.dart';

import 'screens/AddMember.dart';

class EditMember extends StatefulWidget {
  const EditMember({Key? key}) : super(key: key);

  @override
  State<EditMember> createState() => _EditMemberState();
}

class _EditMemberState extends State<EditMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff076792),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Project Name',
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
        actions: [
          // icon Search
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text('Add Tasks'),
                    ),
                    const PopupMenuDivider(
                      height: 1,
                    ),
                    const PopupMenuItem<int>(
                        value: 1, child: Text('Edit Member')),
                    const PopupMenuDivider(
                      height: 1,
                    ),
                    const PopupMenuItem<int>(
                        value: 1, child: Text('Delete Project')),
                  ]),
          // icon more vert
          // IconButton(
          //   onPressed: () {
          //
          //   },
          //   icon: const Icon(
          //     Icons.more_vert,
          //   ),
          // ),
        ],
        // icon back
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Project Name
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'project Name',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff076792),
                ),
              ),
            ),
            // text massage
            Container(
              alignment: Alignment.center,
              child: const Center(
                child: Text(
                  'You Don\'t Have\n Any Members',
                  style:
                      TextStyle(color: Colors.black, fontSize: 25.0, shadows: [
                    //
                    Shadow(
                        color: Colors.grey,
                        offset: Offset(0.1, 0.1),
                        blurRadius: 2),
                  ]),
                ),
              ),
            ),
            // Bottom Add Members
            Container(
              width: double.infinity,
              height: 54,
              margin: const EdgeInsets.fromLTRB(75, 40, 75, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddMember()),
                  );
                },
                child: const Text(
                  'Add Members',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF09679a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    // f... flutter buttons!
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ),
            // text massage
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.only(left: 50.0, right: 20.0, top: 40.0),
              child: const Text(
                'You Don\'t Have \n Any Tasks',
                style: TextStyle(color: Colors.black, fontSize: 25.0, shadows: [
                  Shadow(
                      color: Colors.grey,
                      offset: Offset(0.1, 0.1),
                      blurRadius: 2),
                ]),
              ),
            ),
            // Bottom Add Tasks
            Container(
              width: double.infinity,
              height: 54,
              margin: const EdgeInsets.fromLTRB(75, 40, 75, 0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add Tasks',
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
          ],
        ),
      ),
    );
  }

  onSelected(BuildContext context, Object? item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        break;
      case 1:
        List<String> litems = [];
        TextEditingController txt = new TextEditingController();
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Add Members',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff076792),
                      fontSize: 24,
                    ),
                  ),
                  //not finished spend alot of time maybe i need help lets here run the page then type anything press add icon then save here cntrl+s
                  //it will add new  but with failed name ...
                  content: Container(
                    //height: 190,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Scrollbar(
                          isAlwaysShown: true,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff076792))),
                            height: 110,
                            width: 200,
                            child: ListView.builder(
                                itemCount:
                                    litems == null ? 1 : litems.length + 1,
                                // ignore: dead_code
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          autofocus: true,
                                          controller: txt,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              prefixIcon: IconButton(
                                                  onPressed: () {
                                                    litems.add(txt.toString());
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                  )),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      width: 2,
                                                      color:
                                                          Color(0xff076792))),
                                              filled: true,
                                              hintText: "User Name",
                                              fillColor: Colors.white70),
                                        ));
                                  }
                                  index -= 1;
                                  {
                                    TextEditingController ntxt =
                                        new TextEditingController();
                                    ntxt.text = litems[index].toString();
                                    return //shrinkWrap: true,

                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              autofocus: true,
                                              controller: ntxt,
                                              decoration: InputDecoration(
                                                  prefixIcon: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          //<-- Clear at the end
                                                          ntxt.clear();
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.clear_rounded,
                                                      )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 2,
                                                              color: Color(
                                                                  0xff076792))),
                                                  filled: true,
                                                  hintText: "User Name",
                                                  fillColor: Colors.white70),
                                            ));
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    // f... flutter buttons!
                    side: const BorderSide(color: Color(0xff076792), width: 1),
                  ),
                  actions: [
                    TextButton(onPressed: () {}, child: Text('Add')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'))
                  ],
                ));
        break;
    }
  }
}
