import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/scrollbar.dart';
class Edit_member extends StatefulWidget {
  const Edit_member({ Key? key }) : super(key: key);

  @override
  State<Edit_member> createState() => _Edit_memberState();
}

class _Edit_memberState extends State<Edit_member> {
        List<String> litems = [];
        TextEditingController txt = new TextEditingController();
          final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
        //     List<String> litems = [];
        // TextEditingController txt = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff076792),
                leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Edit Member',
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
      ),
     body: ListView(
       children: 
                  [Container(
                    //height: 190,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 15,),
                          const Center( 
                            child: Text(
          'Edit Member',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff076792),
            fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    color: Color(0xa6A2B6D4),
                    offset: Offset(7,5),
                    blurRadius:20),
              ]
          ),
        ),
                          ),
                          const SizedBox(height: 15,),
                           Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff076792))),
                            height: 280,
                            width: 250,
                            child: ListView.builder(
                                itemCount: litems == null
                                    ? 1
                                    : litems.length + 1,
                                // ignore: dead_code
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: TextField(
                                          autofocus: true,
                                          controller: txt,
                                          keyboardType:
                                          TextInputType.text,
                                          decoration: InputDecoration(
                                              prefixIcon: IconButton(
                                                  onPressed: () {
                                                    litems.add(txt
                                                        .toString());
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                  )),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      10.0),
                                                  borderSide:
                                                  const BorderSide(
                                                      width: 2,
                                                      color: Color(
                                                          0xff076792))),
                                              filled: true,
                                              hintText: "User Name",
                                              fillColor:
                                              Colors.white70),
                                        ));
                                  }
                                  index -= 1;
                                  {
                                    TextEditingController ntxt =
                                    new TextEditingController();
                                    ntxt.text =
                                        litems[index].toString();
                                    return //shrinkWrap: true,
     
                                      Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: TextField(
                                            autofocus: true,
                                            controller: ntxt,
                                            decoration:
                                            InputDecoration(
                                                prefixIcon:
                                                IconButton(
                                                    onPressed:
                                                        () {
                                                      setState(
                                                              () {
                                                            //<-- Clear at the end
                                                            ntxt.clear();
                                                          });
                                                    },
                                                    icon:
                                                    const Icon(
                                                      Icons
                                                          .clear_rounded,
                                                    )),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.0),
                                                    borderSide: const BorderSide(
                                                        width:
                                                        2,
                                                        color: Color(
                                                            0xff076792))),
                                                filled: true,
                                                hintText:
                                                "User Name",
                                                fillColor: Colors
                                                    .white70),
                                          ));
                                  }
                                }),
                          ),
                        
                        const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
                    child: ElevatedButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage02()));
                      },
                      child: const Text('Save Change',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400),
                      ),
     
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff076792),
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(30), // f... flutter buttons!
                            side: const BorderSide(color: Colors.black,width: 1),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(75, 0, 75, 20),
                    child: ElevatedButton(
                      onPressed: (){
                        // Navigator.push(
                        //   context, MaterialPageRoute(builder: (context)));
                          },
                      child: const Text('Cancel',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400),
                      ),
     
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff076792),
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(30), // f... flutter buttons!
                            side: const BorderSide(color: Colors.black,width: 1),
                          )
                      ),
                    ),
                  ),
                      ],
                    ),
                  ),
                ],
     ),
    );
  }
}