
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
class AddMember extends StatefulWidget {
  AddMember({Key? key}) : super(key: key);

  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final _chipKey = GlobalKey<ChipsInputState>();
  @override
  Widget build(BuildContext context) {
    const mockResults = <AppProfile>[
      AppProfile('John Doe', 'jdoe@flutter.io',),
      AppProfile('Paul', 'paul@google.com',),
      AppProfile('Fred', 'fred@google.com',),
      AppProfile('Brian', 'brian@flutter.io',),
      AppProfile('John', 'john@flutter.io',),
      AppProfile('Thomas', 'thomas@flutter.io',),
      AppProfile('Nelly', 'nelly@flutter.io',),
      AppProfile('Marie', 'marie@flutter.io',),
      AppProfile('Charlie', 'charlie@flutter.io',),
      AppProfile('Diana', 'diana@flutter.io',),
      AppProfile('Ernie', 'ernie@flutter.io',),
      AppProfile('Gina', 'fred@flutter.io',),
    ];

    return Scaffold(
      appBar: AppBar( backgroundColor: const Color(0xff076792),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Add Members',
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: ChipsInput(
                      key: _chipKey,
                      /*initialValue: [
                        AppProfile('John Doe', 'jdoe@flutter.io',
                            'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
                      ],*/
                       autofocus: true,
                      // allowChipEditing: true,
                      keyboardAppearance: Brightness.dark,
                      textCapitalization: TextCapitalization.words,
                      // enabled: false,
                      // maxChips: 5,
                      textStyle: const TextStyle(
                          height: 1.5, fontFamily: 'Roboto', fontSize: 16),
                      decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.search),
                        // hintText: formControl.hint,
                        labelText: 'Select People',
                        // enabled: false,
                        // errorText: field.errorText,
                      ),
                      findSuggestions: (String query) {
                        // print("Query: '$query'");
                        if (query.isNotEmpty) {
                          var lowercaseQuery = query.toLowerCase();
                          return mockResults.where((profile) {
                            return profile.name
                                    .toLowerCase()
                                    .contains(query.toLowerCase()) ||
                                profile.email
                                    .toLowerCase()
                                    .contains(query.toLowerCase());
                          }).toList(growable: false)
                            ..sort((a, b) => a.name
                                .toLowerCase()
                                .indexOf(lowercaseQuery)
                                .compareTo(
                                    b.name.toLowerCase().indexOf(lowercaseQuery)));
                        }
                        // return <AppProfile>[];
                        return mockResults;
                      },
                      onChanged: (data) {
                        // print(data);
                      },
                      chipBuilder: (context, state, dynamic profile) {
                        return InputChip(
                          key: ObjectKey(profile),
                          label: Text(profile.name),
                          avatar:  const Icon(Icons.account_box_rounded),
                          onDeleted: () => state.deleteChip(profile),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        );
                      },
                      suggestionBuilder: (context, state, dynamic profile) {
                        return ListTile(
                          key: ObjectKey(profile),
                          leading: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.account_box_rounded),),
                          title: Text(profile.name),
                          subtitle: Text(profile.email),
                          onTap: () => state.selectSuggestion(profile),
                        );
                      },
                    ),
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      // _chipKey.currentState!.selectSuggestion(AppProfile(
                      //     'Gina',
                      //     'fred@flutter.io',
                      //     '));
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ), 
    );
  }
}

class AppProfile {
  final String name;
  final String email;
  //final String imageUrl;

  const AppProfile(this.name, this.email,);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppProfile &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}