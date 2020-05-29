import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'System/Volunteer.dart';
import '_global.dart' as globals;
import 'register_volnuteer8.dart';

class register_volunteer7 extends StatefulWidget {
  @override
  _register_volunteer7State createState() => _register_volunteer7State();
}

class _register_volunteer7State extends State<register_volunteer7> {
  final twitter = TextEditingController();
  final linkedin = TextEditingController();

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
      twitter.text = globals.logedVolunteer.data[0]["Twitter"].toString();
      linkedin.text = globals.logedVolunteer.data[0]["Linkedin"].toString();
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
                    "التواصل الاجتماعي",
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
                Container(
                  child: new TextField(
                    obscureText: false,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    controller: twitter,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'اكتب رمز تويتير',
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
                    controller: linkedin,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'تعريف linkedIN',
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
                      globals.logedVolunteer.Twitter = twitter.text;
                      globals.logedVolunteer.LinkedIN = linkedin.text;
                    } else {
                      globals.registerVolunteer.Twitter = twitter.text;
                      globals.registerVolunteer.LinkedIN = linkedin.text;
                    }
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: register_volunteer8()));
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
}
