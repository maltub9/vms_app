import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'System/Volunteer.dart';
import '_global.dart' as globals;

class register_volunteer8 extends StatefulWidget {
  @override
  _register_volunteer8State createState() => _register_volunteer8State();
}

class _register_volunteer8State extends State<register_volunteer8> {
  final List<String> names = <String>[];
  TextEditingController nameController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
      value,
      textDirection: TextDirection.rtl,
    )));
  }

  @override
  void initState() {
    super.initState();
    if (globals.logedVolunteer.data.length != 0) {
      setState(() {
        names.addAll(globals.logedVolunteer.data[0]["Qualification"]
            .toString()
            .split(','));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: new Container(
            height: screenHeight,
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 30),
                Container(
                  child: Row(
                    children: <Widget>[
                      new FlatButton(
                          child: new Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.only(right: 100.0)),
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: new Image(
                          image: new NetworkImage(
                              'http://flutter01.com/VMSX/athar.png'),
                          width: screenWidth / 3,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                new SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "الشهادات",
                    textDirection: TextDirection.rtl,
                    style: new TextStyle(
                      fontFamily: 'inline',
                      fontSize: 20.0,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ), //30,136,169

                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    maxLength: 20,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'اسم الشهادة',
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                RaisedButton(
                  child: Text('اضافة'),
                  onPressed: () {
                    addItemToList();
                  },
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: names.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            margin: EdgeInsets.all(2),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: screenWidth * 0.6,
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    '${names[index]}',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                new SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  width: 30,
                                  child: new RaisedButton(
                                    child: new Text(
                                      "X",
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        names.removeAt(index);
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            decoration: new BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        })),
                new SizedBox(height: 20),

                new RaisedButton(
                  child: Container(
                    child: Center(
                      child: new Text(
                        "حفظ",
                        style: new TextStyle(
                            color: Colors.white, fontFamily: 'buttons'),
                      ),
                    ),
                    width: screenWidth / 2,
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                  color: Color.fromARGB(255, 30, 136, 169),
                  onPressed: () async {
                    var result = null;

                    if (globals.logedVolunteer.data.length != 0) {
                      globals.logedVolunteer.Qualification = names.join(',');
                      globals.logedVolunteer.ID= int.parse(globals.logedVolunteer.data[0]["ID"].toString());
                      result = await globals.logedVolunteer.update(globals.logedVolunteer.toJson());
                    } else {
                      globals.registerVolunteer.Qualification = names.join(',');

                      globals.registerVolunteer.data.clear();
                      globals.registerVolunteer.addRow();

                      result = await globals.registerVolunteer.updateCurrent();
                    }
                    if (result.toString() == 'true') {
                      showInSnackBar("تم الحفظ");
                      Navigator.of(context).pushNamed("/home");
                    } else
                      showInSnackBar("لم يتم الحفظ");
                  },
                  padding: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [
                Color.fromARGB(255, 113, 173, 192),
                Color.fromARGB(255, 254, 254, 254)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
        ),
      ),
    );
  }

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      nameController.clear();
    });
  }
}
