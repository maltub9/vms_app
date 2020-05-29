import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'System/Volunteer.dart';
import '_global.dart' as globals;
import 'register_volunteer3.dart';

class register_volunteer2 extends StatefulWidget {
  @override
  _register_volunteer2State createState() => _register_volunteer2State();
}

class _register_volunteer2State extends State<register_volunteer2> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String sex = 'ذكر';
  String martial;

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
      nameController.text = globals.logedVolunteer.data[0]["Name"].toString();
      emailController.text = globals.logedVolunteer.data[0]["Email"].toString();
      mobileController.text =
          globals.logedVolunteer.data[0]["Mobile"].toString();
      usernameController.text =
          globals.logedVolunteer.data[0]["UserName"].toString();
      passwordController.text =
          globals.logedVolunteer.data[0]["PassWord"].toString();
      sex = globals.logedVolunteer.data[0]["Sex"].toString();
      martial = globals.logedVolunteer.data[0]["Social_State"].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        
              child: Center(
          child: new Container(
            height: globals.screenHeight,
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
                    "معلومات الحساب",
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
                    controller: nameController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'الأسم',
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
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'البريد الالكتروني',
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
                    controller: mobileController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'رقم الجوال',
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
                    controller: usernameController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'اسم المستخدم',
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
                    controller: passwordController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'كلمة السر',
                    ),
                  ),
                  width: 200.0,
                ),
                new SizedBox(height: 20),
                new Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Container(child: new Text(" الجنس "),width: 100,),
                    new Radio(
                      groupValue: sex,
                      onChanged: (T) {
                        setState(() {
                          sex = T;
                        });
                      },
                      value: 'ذكر',
                    ),
                    new Text('ذكر'),
                    new Radio(
                      groupValue: sex,
                      onChanged: (T) {
                        setState(() {
                          sex = T;
                        });
                      },
                      value: 'انثى',
                    ),
                    new Text('انثى'),
                  ],
                ),
                new Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Container(child: new Text(" الحالة الاجتماعية "),width: 100,),
                    new Radio(
                      groupValue: martial,
                      onChanged: (T) {
                        setState(() {
                          martial = T;
                        });
                      },
                      value: 'اعزب',
                    ),
                    new Text('اعزب'),
                    new Radio(
                      groupValue: martial,
                      onChanged: (T) {
                        setState(() {
                          martial = T;
                        });
                      },
                      value: 'متزوج',
                    ),
                    new Text('متزوج'),
                    new Radio(
                      groupValue: martial,
                      onChanged: (T) {
                        setState(() {
                          martial = T;
                        });
                      },
                      value: 'ارمل',
                    ),
                    new Text('ارمل'),
                  ],
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
                      //
                      globals.logedVolunteer.Name = nameController.text;
                      globals.logedVolunteer.Email = emailController.text;
                      globals.logedVolunteer.Mobile = mobileController.text;
                      globals.logedVolunteer.UserName = usernameController.text;
                      globals.logedVolunteer.PassWord = passwordController.text;
                      globals.logedVolunteer.Social_State = martial;
                      globals.logedVolunteer.Sex = sex;
                    } else {
                      globals.registerVolunteer.Name = nameController.text;
                      globals.registerVolunteer.Email = emailController.text;
                      globals.registerVolunteer.Mobile = mobileController.text;
                      globals.registerVolunteer.UserName =
                          usernameController.text;
                      globals.registerVolunteer.PassWord =
                          passwordController.text;
                      globals.registerVolunteer.Social_State = martial;
                      globals.registerVolunteer.Sex = sex;
                    }
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: register_volunteer3()));
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
