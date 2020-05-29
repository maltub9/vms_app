import 'dart:async';
import 'dart:io';

import '_basic/Network.dart';
import 'package:athar_app/register_volunteer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '_global.dart'  as globals;

class reset_password extends StatefulWidget {
  @override
  _reset_passwordState createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  final emailController = TextEditingController();//
  final passwordController = TextEditingController();
  final resetController = TextEditingController();

  int tryCount = 0;
  bool in_progress=false;
  TextStyle ts = new TextStyle(fontSize: 18.0, fontFamily: 'inline');
  final List<Widget> reset_form=new List<Widget>();
  String reset_code = "";
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
      reset_form.add(new SizedBox(height: 20,));
   }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key:_scaffoldKey,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'جمعية اثر الصحية',
          style: ts,
        ),
      ),
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
                        width: globals.screenWidth / 3,
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
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                    border: OutlineInputBorder(),
                    hintText: 'الأيميل',
                  ),
                  
                ),
                width: 200.0,
              ),
              new SizedBox(height: 10),
              Container(
                child: new TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  controller: passwordController,
                  decoration: InputDecoration.collapsed(
                    border: OutlineInputBorder(),
                    hintText: 'كلمة السر الجديدة',
                  ),
                  
                ),
                width: 200.0,
              ),

              new SizedBox(height: 20),
              if(!in_progress)
              new RaisedButton(
                child: Container(
                  child: Center(
                    child: new Text(
                      "اعادة تعيين",
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'buttons'),
                    ),
                  ),
                  width: globals.screenWidth / 2,
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                color: Color.fromARGB(255, 30, 136, 169),
                onPressed: () async {
                  if(in_progress)
                    return;
                    setState(() {
                      in_progress=true;
                    });
                  globals.logedVolunteer.data.clear();
                  String cond = "password=" + passwordController.text + "&email=" + emailController.text;

                  String url = 'https://flutter01.com/VMSX/password_reset_submit.php?' + cond;
                    Network n = new Network(url);
                    String r = await n.getData();
                    if(r=="الأيميل غير مسجل")
                    {
                      showInSnackBar(r);
                      Timer(Duration(seconds: 3), () {
                          Navigator.of(context).pop();
                        });
                      return;
                    }
                    reset_code = r.substring(r.indexOf("|")+1); 
                    List<Widget> rx = new List<Widget>();
                    rx.add(new TextField(
                      obscureText: true,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  controller: resetController,
                  decoration: InputDecoration.collapsed(
                    border: OutlineInputBorder(),
                    hintText: 'ادخل الرمز',
                    )));
                    rx.add(

                      new RaisedButton(
                child: Container(
                  child: Center(
                    child: new Text(
                      "تأكيد الرمز",
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'buttons'),
                    ),
                  ),
                  width: globals.screenWidth / 2,
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                color: Color.fromARGB(255, 30, 136, 169),
                onPressed: () async {
                  //if code correct notify user..
                  if(reset_code==resetController.text)
                  {
                    String cond = "password=" + passwordController.text + "&email=" + emailController.text;

                  String url = 'https://flutter01.com/VMSX/update_password.php?' + cond;
                  Network n = new Network(url);
                  await n.getData();
                  showInSnackBar("تم تغيير كلمة السر");
                  //go to login screen...
                  Timer(Duration(seconds: 3), () {
                    Navigator.of(context).pop();
                  });
                  }
                  else
                  {
                  //else //if trycount >5 exit application...
                  tryCount++;
                  if(tryCount==5)
                  {
                    showInSnackBar("تم استنفاذ المحاولات");
                  //go to login screen...
                  Timer(Duration(seconds: 3), () {
                    exit(0);
                  });
                  }
                  }
                })

                    );
                    reset_form.addAll(rx);                                                              
                    setState(() {
                      in_progress=false;
                    });
                    //showDialog(context: context,builder: (_)=>ad);
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
            new Column(
              children: reset_form,
            )
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
