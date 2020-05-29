import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import '_global.dart' as globals;
import 'register_volunteer4.dart';

class register_volunteer3 extends StatefulWidget {
  @override
  _register_volunteer3State createState() => _register_volunteer3State();
}

class _register_volunteer3State extends State<register_volunteer3> {
  var currentCountry;
  var countries = ["السعودية", "الاردن", "فلسطين"];
  DateTime birthDate;
  String birthDateStr = 'اختر التاريخ';
  final nIDController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
      value,
      textDirection: TextDirection.rtl,
    )));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Center(
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
              new SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "هل ترغب باستكمال البيانات الان؟",
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    fontFamily: 'inline',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ), //30,136,169
              new SizedBox(height: 30),
              new RaisedButton(
                child: Container(
                  child: Center(
                    child: new Text(
                      "نعم",
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'buttons'),
                    ),
                  ),
                  width: screenWidth / 2,
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                color: Color.fromARGB(255, 30, 55, 55),
                onPressed: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: register_volunteer4()));
                },
                padding: const EdgeInsets.all(4.0),
              ),
              new RaisedButton(
                child: Container(
                  child: Center(
                    child: new Text(
                      "لاحقاً",
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'buttons'),
                    ),
                  ),
                  width: screenWidth / 2,
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                color: Color.fromARGB(255, 30, 136, 169),
                onPressed: () async {
                  if (globals.logedVolunteer.data.length != 0) {
                    globals.logedVolunteer.ID= int.parse(globals.logedVolunteer.data[0]["ID"]);
                    var result = await globals.logedVolunteer.update(globals.logedVolunteer.toJson());
                    if (result.toString() == 'true') {
                      Navigator.of(context).pushNamed("/home");
                      showInSnackBar('تم تسجيل البيانات');
                    } else {
                      if (globals.logedVolunteer.errorMessage
                              .indexOf('UNIQUE_USERNAME') >
                          0) {
                        showInSnackBar('اسم المستخدم موجود، اختر اسم اخر');
                      } else
                        showInSnackBar(globals.logedVolunteer.errorMessage);
                    }
                  } else {
                    globals.registerVolunteer.data.clear();
                    globals.registerVolunteer.addRow();
                    var result = globals.registerVolunteer.updateCurrent();
                    if (result.toString() == 'true') {
                      Navigator.of(context).pushNamed("/home");
                      showInSnackBar('تم تسجيل البيانات');
                    } else {
                      if (globals.registerVolunteer.errorMessage
                              .indexOf('UNIQUE_USERNAME') >
                          0) {
                        showInSnackBar('اسم المستخدم موجود، اختر اسم اخر');
                      } else
                        showInSnackBar(globals.registerVolunteer.errorMessage);
                    }
                  }
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
    );
  }
}
