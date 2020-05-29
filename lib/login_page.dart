import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:athar_app/volunteer_dashboard.dart';
import 'package:athar_app/reset_password.dart';
import 'package:getflutter/getflutter.dart';

import '_global.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '_basic/Network.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool in_progress = false;
  bool passwordVisible = true;
  @override
  void initState() {
    super.initState();
    //initialize opportunities...
    String cond = "\"DT_Start\">now()";
    globals.futureOpportunity.search(cond);
    cond = "\"DT_Finish\"<now()";
    globals.pastOpportunity.search(cond);
    globals.initializeWidgets();
    int x = 0;
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
      value,
      textDirection: TextDirection.rtl,
    )));
  }

  AlertDialog ad = new AlertDialog(
    content: new Text(
      "المستخدم او كلمة السر خاطئة",
      textDirection: TextDirection.rtl,
    ),
    //shape:CircleBorder()
  );

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
              new SizedBox(height: 10),
              Container(
                child: TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  obscureText:
                      passwordVisible, //This will obscure text dynamically
                  decoration: InputDecoration(
                    hintText: 'كلمة السر',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                width: 200.0,
              ),
              new SizedBox(height: 20),
              if (!in_progress)
                new RaisedButton(
                  child: Container(
                    child: Center(
                      child: new Text(
                        "تسجيل دخول",
                        style: new TextStyle(
                            color: Colors.white, fontFamily: 'buttons'),
                      ),
                    ),
                    width: screenWidth / 2,
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                  color: Color.fromARGB(255, 30, 136, 169),
                  onPressed: () async {
                    if (in_progress) return;
                    setState(() {
                      in_progress = true;
                    });
                    globals.logedVolunteer.data.clear();
                    String cond = "\"PassWord\"='" +
                        passwordController.text +
                        "' AND \"UserName\"='" +
                        usernameController.text +
                        "'";

                    await globals.logedVolunteer.search(cond);
                    if (globals.logedVolunteer.data.length > 0) {
                      String r = await globals.logedVolunteer.get_value(
                          "SELECT COUNT(*) FROM \"Opportunity_Volunteers\" WHERE \"Volunteer_Username\"='" +
                              usernameController.text +
                              "' AND \"Is_Approved\"='pendding'");
                      globals.volunteerPendingRegisteration = (r != "0");

                      r = await globals.logedVolunteer.get_value(
                          "SELECT \"Opportunity_ID\" FROM \"Opportunity_Volunteers\" WHERE \"Volunteer_Username\"='" +
                              usernameController.text +
                              "' AND \"Is_Approved\"='approved' AND \"Opportunity_ID\" IN (SELECT \"ID\" FROM \"Opportunity\" WHERE \"DT_Start\"<=NOW() AND \"DT_Finish\">=NOW())");
                      globals.volunteer_op = int.parse(r);

                      r = await globals.logedVolunteer.get_value(
                          "SELECT \"Team_ID\" FROM \"Opportunity_Volunteers\" WHERE \"Volunteer_Username\"='" +
                              usernameController.text +
                              "' AND \"Is_Approved\"='approved' AND \"Opportunity_ID\" IN (SELECT \"ID\" FROM \"Opportunity\" WHERE \"DT_Start\"<=NOW() AND \"DT_Finish\">=NOW())");
                      globals.volunteer_team_id = int.parse(r);
                      String url =
                          'https://flutter01.com/VMSX/dl_host/personal_profile.php?vname=' +
                              globals.logedVolunteer.data[0]['UserName']
                                  .toString();
                      Network n = new Network(url);
                      globals.my_profile_data = await n.getData();
                      setState(() {
                        in_progress = false;
                      });

                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: volunteer_dashboard()));
                    } else {
                      showDialog(context: context, builder: (_) => ad);
                    }
                  },
                  padding: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                )
              else
                SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              new SizedBox(height: 20),
              new RaisedButton(
                child: Container(
                  child: Center(
                    child: new Text(
                      "نسيت كلمة السر؟",
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'buttons'),
                    ),
                  ),
                  width: screenWidth / 2,
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                color: Color.fromARGB(255, 150, 99, 99),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: reset_password()));
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
