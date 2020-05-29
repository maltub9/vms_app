import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'System/Volunteer.dart';
import '_global.dart' as globals;
import 'register_volunteer5.dart';

class register_volunteer4 extends StatefulWidget {
  @override
  _register_volunteer4State createState() => _register_volunteer4State();
}

class _register_volunteer4State extends State<register_volunteer4> {
  final jobDetailController = TextEditingController();
  final jobController = TextEditingController();
  final districtController = TextEditingController();
  final areaController = TextEditingController();
  String degree = 'مدرسة';
  String dropTxt1 = "التحصيل العلمي";
  var degrees = ["مدرسة", "دبلوم متوسط", "بكالوريوس", "ماجستير", "دكتوراة"];

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
              dropTxt1=vals[i];
              degree=vals[i];
            });
            
            
          },
                  child: Container(
            child: new Text(vals[i],textDirection: TextDirection.rtl,),
            width:globals.screenWidth*0.9,
            decoration: BoxDecoration(
                border: Border(right: bs,bottom: bs,left:bs,top:bs)),
          ),
        ),
        clipper: ShapeBorderClipper(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      ),
    ));
  }

  return list;
}


  @override
  void initState() {
    super.initState();
    if (globals.logedVolunteer.data.length != 0) {
      jobDetailController.text =
          globals.logedVolunteer.data[0]["Job_Detail"].toString();
      jobController.text = globals.logedVolunteer.data[0]["Job"].toString();
      districtController.text =
          globals.logedVolunteer.data[0]["District"].toString();
      areaController.text = globals.logedVolunteer.data[0]["Area"].toString();
      String aca = globals.logedVolunteer.data[0]["Academic"].toString();
      if (aca != "") degree = aca;

      //
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
                    "معلومات شخصية",
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
                    controller: areaController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'المنطقة',
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
                    controller: districtController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'الحي',
                    ),
                  ),
                  width: 200.0,
                ),
                new SizedBox(height: 20),
                ExpansionTile(
                  key: GlobalKey(),
                  title: Text(dropTxt1,textDirection: TextDirection.rtl,),
                  children: listOfCard(degrees),
                ),
                new SizedBox(height: 20),
                Container(
                  child: new TextField(
                    obscureText: false,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    controller: jobController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'الوظيفة',
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
                    controller: jobDetailController,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: 'تفاصيل الوظيفة',
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
                      globals.logedVolunteer.Job_Detail =
                          jobDetailController.text;
                      globals.logedVolunteer.Job = jobController.text;
                      globals.logedVolunteer.District = districtController.text;
                      globals.logedVolunteer.Area = areaController.text;
                      globals.logedVolunteer.Academic = degree;
                    } else {
                      globals.registerVolunteer.Job_Detail =
                          jobDetailController.text;
                      globals.registerVolunteer.Job = jobController.text;
                      globals.registerVolunteer.District =
                          districtController.text;
                      globals.registerVolunteer.Area = areaController.text;
                      globals.registerVolunteer.Academic = degree;
                    }
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: register_volunteer5()));
                  },
                  padding: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                new SizedBox(height:200)
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

