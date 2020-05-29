import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'System/Volunteer.dart';
import '_global.dart' as globals;
import 'register_volunteer7.dart';

class register_volunteer6 extends StatefulWidget {
  @override
  _register_volunteer6State createState() => _register_volunteer6State();
}

class _register_volunteer6State extends State<register_volunteer6> {
  final tempDisease = TextEditingController();
  final specialNeed = TextEditingController();
  final emergencyMobile = TextEditingController();

  String blood_type='اختر فصيلة الدم';
  var blood_types = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
      value,
      textDirection: TextDirection.rtl,
    )));
  }

  List<Widget> listOfCard(List<String> vals) {
    BorderSide bs = BorderSide(color: Colors.blueAccent, width: 1);
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < vals.length; i++) {
      list.add(Card(
        elevation: 2,
        child: ClipPath(
          child: GestureDetector(
            onTap: () {
              setState(() {
                blood_type = vals[i];
              });
            },
            child: Container(
              child: new Text(
                vals[i],
                textDirection: TextDirection.rtl,
              ),
              width: globals.screenWidth * 0.9,
              decoration: BoxDecoration(
                  border: Border(right: bs, bottom: bs, left: bs, top: bs)),
            ),
          ),
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
        ),
      ));
    }

    return list;
  }


  @override
  void initState() {
    super.initState();
    if (globals.logedVolunteer.data.length != 0) {
      tempDisease.text =
          globals.logedVolunteer.data[0]["Temp_Disease"].toString();
      specialNeed.text =
          globals.logedVolunteer.data[0]["Special_Need"].toString();
      emergencyMobile.text =
          globals.logedVolunteer.data[0]["Emergency_Mobile"].toString();
          if(globals.logedVolunteer.data[0]["Blood_Type"].toString()!="")
      blood_type = globals.logedVolunteer.data[0]["Blood_Type"].toString();
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
            
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 40),
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
                    "المعلومات الطبية",
                    textDirection: TextDirection.rtl,
                    style: new TextStyle(
                      fontFamily: 'inline',
                      fontSize: 20.0,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ), //30,136,169
                new SizedBox(height: 30),
                new ExpansionTile(
                  key: GlobalKey(),
                  title: Text(
                    blood_type,
                    textDirection: TextDirection.rtl,
                  ),
                  children: listOfCard(blood_types),
                ),
                new SizedBox(height: 30),
                Container(
                  child: new TextField(
                    obscureText: false,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    controller: tempDisease,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'امراض مزمنة',
                    ),
                  ),
                  width: 200.0,
                ),
                new SizedBox(height: 20),
                Container(
                  child: new TextField(
                    obscureText: false,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    controller: specialNeed,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'احتياجات خاصة',
                    ),
                  ),
                  width: 200.0,
                ),
                new SizedBox(height: 20),
                Container(
                  child: new TextField(
                    obscureText: false,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    controller: emergencyMobile,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'هاتف الطوارئ',
                    ),
                  ),
                  width: 200.0,
                ),
                new SizedBox(height: 20),
                new RaisedButton(
                  child: Container(
                    child: Center(
                      child: new Text(
                        "التالي",
                        style: new TextStyle(
                            color: Colors.white, fontFamily: 'buttons'),
                      ),
                    ),
                    width: screenWidth / 2,
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                  color: Color.fromARGB(255, 30, 136, 169),
                  onPressed: () {
                    if (globals.logedVolunteer.data.length != 0) {
                      globals.logedVolunteer.Emergency_Mobile =
                          emergencyMobile.text;
                      globals.logedVolunteer.Special_Need = specialNeed.text;
                      globals.logedVolunteer.Temp_Disease = tempDisease.text;
                      globals.logedVolunteer.Blood_Type = blood_type;
                    } else {
                      globals.registerVolunteer.Emergency_Mobile =
                          emergencyMobile.text;
                      globals.registerVolunteer.Special_Need = specialNeed.text;
                      globals.registerVolunteer.Temp_Disease = tempDisease.text;
                      globals.registerVolunteer.Blood_Type = blood_type;
                    }
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: register_volunteer7()));
                  },
                  padding: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                new SizedBox(height: 200,)
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
}
