import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'System/Volunteer.dart';
import '_global.dart' as globals;
import 'register_volunteer6.dart';

class register_volunteer5 extends StatefulWidget {
  @override
  _register_volunteer5State createState() => _register_volunteer5State();
}

class _register_volunteer5State extends State<register_volunteer5> {
  String opportunity = "اختر فرصة";
  var opportunities = [
    'الحملة التوعوية الميدانية لتوزيع الحقائب الوقائية في مدينة الرياض',
    'تجهيز الحقائب الوقائية بمعمل الانتاج بالجمعية',
    'المشاركة بمركز الاتصال الهاتفي التوعوي',
    'الخدمات الإدارية المساندة ( إدارة - تدريب - تنظيم -إعلام )'
  ];
  String opportunity_type = "اختر نوع الفرصة";
  var opportunity_types = ['صحي', 'بيئي', 'تربوي', 'تعليمي', 'تطوير ذاتي'];
  String opportunity_time='اختر الوقت المفضل';
  var opportunity_times = [
    '10صباحاً إلى 2 ظهرا',
    '2 ظهرا إلى 6 مساءً',
    '4 عصراً إلى 8 مساءً'
  ];

  List<String> favDays = new List<String>();
  List<String> intrests = new List<String>();

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
                opportunity = vals[i];
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

  List<Widget> listOfCard2(List<String> vals) {
    BorderSide bs = BorderSide(color: Colors.blueAccent, width: 1);
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < vals.length; i++) {
      list.add(Card(
        elevation: 2,
        child: ClipPath(
          child: GestureDetector(
            onTap: () {
              setState(() {
                opportunity_type = vals[i];
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

  List<Widget> listOfCard3(List<String> vals) {
    BorderSide bs = BorderSide(color: Colors.blueAccent, width: 1);
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < vals.length; i++) {
      list.add(Card(
        elevation: 2,
        child: ClipPath(
          child: GestureDetector(
            onTap: () {
              setState(() {
                opportunity_time = vals[i];
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
      if (globals.logedVolunteer.data[0]["Volunteer_Chance"].toString() != "")
        opportunity =
            globals.logedVolunteer.data[0]["Volunteer_Chance"].toString();
      if (globals.logedVolunteer.data[0]["Opportunity_Type"].toString() != "")
        opportunity_type =
            globals.logedVolunteer.data[0]["Opportunity_Type"].toString();
      if (globals.logedVolunteer.data[0]["Volunteer_Preferred_Time"]
              .toString() !=
          "")
        opportunity_time = globals
            .logedVolunteer.data[0]["Volunteer_Preferred_Time"]
            .toString();
      favDays = globals.logedVolunteer.data[0]["Preferred_Days"]
          .toString()
          .split(',');
      intrests =
          globals.logedVolunteer.data[0]["Concerns"].toString().split(',');
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
                    "التطوع",
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
                    opportunity,
                    textDirection: TextDirection.rtl,
                  ),
                  children: listOfCard(opportunities),
                ),
                new ExpansionTile(
                  key: GlobalKey(),
                  title: Text(
                    opportunity_type,
                    textDirection: TextDirection.rtl,
                  ),
                  children: listOfCard2(opportunity_types),
                ),
                new Text("الايام التطوعية المفضلة"),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("السبت"),
                      new Checkbox(
                          value: (favDays.indexOf('السبت') > -1),
                          onChanged: (bool v) {
                            setFavDays('السبت', v);
                            setState(() {});
                          }),
                      new Text("الاحد"),
                      new Checkbox(
                          value: (favDays.indexOf('الاحد') > -1),
                          onChanged: (bool v) {
                            setFavDays('الاحد', v);
                            setState(() {});
                          }),
                      new Text("الاثنين"),
                      new Checkbox(
                          value: (favDays.indexOf('الاثنين') > -1),
                          onChanged: (bool v) {
                            setFavDays('الاثنين', v);
                            setState(() {});
                          }),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("الثلاثاء"),
                      new Checkbox(
                          value: (favDays.indexOf('الثلاثاء') > -1),
                          onChanged: (bool v) {
                            setFavDays('الثلاثاء', v);
                            setState(() {});
                          }),
                      new Text("الاربعاء"),
                      new Checkbox(
                          value: (favDays.indexOf('الاربعاء') > -1),
                          onChanged: (bool v) {
                            setFavDays('الاربعاء', v);
                            setState(() {});
                          }),
                      new Text("الخميس"),
                      new Checkbox(
                          value: (favDays.indexOf('الخميس') > -1),
                          onChanged: (bool v) {
                            setFavDays('الخميس', v);
                            setState(() {});
                          }),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("الجمعة"),
                      new Checkbox(
                          value: (favDays.indexOf('الجمعة') > -1),
                          onChanged: (bool v) {
                            setFavDays('الجمعة', v);
                            setState(() {});
                          }),
                    ],
                  ),
                ),
                new ExpansionTile(
                  key: GlobalKey(),
                  title: Text(
                    opportunity_time,
                    textDirection: TextDirection.rtl,
                  ),
                  children: listOfCard3(opportunity_times),
                ),
                new Text("النشاطات المفضلة"),
                new Column(
                  children: <Widget>[
                    new SizedBox(height: 20),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("اغاثية"),
                          new Checkbox(
                              value: (intrests.indexOf('اغاثية') > -1),
                              onChanged: (bool v) {
                                setFavActions('اغاثية', v);
                                setState(() {});
                              }),
                          new Text("أدبية"),
                          new Checkbox(
                              value: (intrests.indexOf('أدبية') > -1),
                              onChanged: (bool v) {
                                setFavActions('أدبية', v);
                                setState(() {});
                              }),
                          new Text("ثقافية"),
                          new Checkbox(
                              value: (intrests.indexOf('ثقافية') > -1),
                              onChanged: (bool v) {
                                setFavActions('ثقافية', v);
                                setState(() {});
                              }),
                        ],
                      ),
                    ),
                    
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("فنية"),
                          new Checkbox(
                              value: (intrests.indexOf('فنية') > -1),
                              onChanged: (bool v) {
                                setFavActions('فنية', v);
                                setState(() {});
                              }),
                          new Text("سياحية"),
                          new Checkbox(
                              value: (intrests.indexOf('سياحية') > -1),
                              onChanged: (bool v) {
                                setFavActions('سياحية', v);
                                setState(() {});
                              }),
                          new Text("تقنية"),
                          new Checkbox(
                              value: (intrests.indexOf('تقنية') > -1),
                              onChanged: (bool v) {
                                setFavActions('تقنية', v);
                                setState(() {});
                              }),
                        ],
                      ),
                    ),
                  ],
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
                      globals.logedVolunteer.Preferred_Days = favDays.join(',');
                      globals.logedVolunteer.Opportunity_Type =
                          opportunity_type;
                      globals.logedVolunteer.Volunteer_Chance = opportunity;
                      globals.logedVolunteer.Volunteer_Preferred_Time =
                          opportunity_time;
                      globals.logedVolunteer.Concerns = intrests.join(',');
                    } else {
                      globals.registerVolunteer.Preferred_Days =
                          favDays.join(',');
                      globals.registerVolunteer.Opportunity_Type =
                          opportunity_type;
                      globals.registerVolunteer.Volunteer_Chance = opportunity;
                      globals.registerVolunteer.Volunteer_Preferred_Time =
                          opportunity_time;
                      globals.registerVolunteer.Concerns = intrests.join(',');
                    }
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: register_volunteer6()));
                  },
                  padding: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                new SizedBox(height: 40,)
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

  void setFavDays(String s, bool v) {
    if (v) {
      if (favDays.indexOf(s) == -1) {
        favDays.add(s);
      }
    } else {
      favDays.remove(s);
    }
  }

  void setFavActions(String s, bool v) {
    if (v) {
      if (intrests.indexOf(s) == -1) {
        intrests.add(s);
      }
    } else {
      intrests.remove(s);
    }
  }
}
