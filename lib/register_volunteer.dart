import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:athar_app/register_volunteer2.dart';

import '_global.dart' as globals;

class register_volunteer extends StatefulWidget {
  @override
  _register_volunteerState createState() => _register_volunteerState();
}

class _register_volunteerState extends State<register_volunteer> {
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
  void initState() {
    super.initState();
    if (globals.logedVolunteer.data.length != 0) {
      nIDController.text =
          globals.logedVolunteer.data[0]["National_ID"].toString();
      currentCountry = globals.logedVolunteer.data[0]["Country"].toString();
      birthDateStr = globals.logedVolunteer.data[0]["DT_Birth"].toString();
      //
    }
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
                  "يجب ان يكون المتطوع مسجلاً في ابشر وان يكون فوق الـ18 عام",
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
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text("اختر الدولة"),
                  value: currentCountry,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      currentCountry = newValue;
                    });
                  },
                  items: countries.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              new SizedBox(height: 20),
              Container(
                child: new TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  controller: nIDController,
                  decoration: InputDecoration.collapsed(
                    border: OutlineInputBorder(),
                    hintText: 'رقم الهوية',
                  ),
                ),
                width: 200.0,
              ),

              new SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "تاريخ الميلاد",
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    fontFamily: 'inline',
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ), //30,136,169
              new RaisedButton(
                child: Container(
                  child: Center(
                    child: new Text(
                      birthDateStr,
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'buttons'),
                    ),
                  ),
                  width: screenWidth / 2,
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                color: Color.fromARGB(255, 30, 55, 55),
                onPressed: () async {
                  DateTime newDateTime = await showRoundedDatePicker(
                    context: context,
                    firstDate:
                        DateTime.now().subtract(new Duration(days: 365 * 60)),
                    theme: ThemeData(primarySwatch: Colors.brown),
                  );

                  birthDate = newDateTime;
                  setState(() {
                    if (birthDate != null)
                      birthDateStr = birthDate.year.toString() +
                          "-" +
                          birthDate.month.toString() +
                          "-" +
                          birthDate.day.toString();
                  });
                },
                padding: const EdgeInsets.all(4.0),
              ),
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
                    globals.logedVolunteer.Country = currentCountry;
                    globals.logedVolunteer.DT_Birth = birthDate;
                    globals.logedVolunteer.National_ID = nIDController.text;
                  } else {
                    globals.registerVolunteer.Country = currentCountry;
                    globals.registerVolunteer.DT_Birth = birthDate;
                    globals.registerVolunteer.National_ID = nIDController.text;
                  }
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: register_volunteer2()));
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
