import 'package:athar_app/register_volunteer.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_page.dart';
import '_global.dart' as globals;

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
    routes: <String,WidgetBuilder>{
        "/home":(BuildContext context)=>new MyApp(),
      },
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    globals.screenWidth = MediaQuery.of(context).size.width;
    globals.screenHeight = MediaQuery.of(context).size.height;

    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      image: new Image.network('http://flutter01.com/VMSX/athar.png'),
      gradientBackground: new LinearGradient(colors: [Color.fromARGB(255,245,237,239),Color.fromARGB(255, 107,71,78)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter"),
      loaderColor: Colors.blueAccent,

    );
  }

  

}

class AfterSplash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      
          bottomSheet: GestureDetector(
            onTap: () async {

            const url = 'http://florence-jo.com/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }

            },
            behavior: HitTestBehavior.translucent,
                      child: new Container(
              
                child:new Text("تطوير شركة فلورنسا 2020",style: new TextStyle(
                  color: Colors.blue,

                ),textDirection: TextDirection.rtl,),
                decoration:  new BoxDecoration(
              color: Colors.black
        ),
        width: globals.screenWidth,
        
              ),
          ),
          body: Center(
            child: new Container(
        child: new Column(children: <Widget>[
            new SizedBox(height: 150), 
            new Image(image: new NetworkImage('http://flutter01.com/VMSX/athar.png')),
            new SizedBox(height: 100), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("هي حاضنة سعودية للعمل التطوعي توفر بيئة آمنة تخدم و تنظم العلاقة بين الجهات الموفرة للفرص التطوعية و المتطوعين في المملكة",
              textDirection: TextDirection.rtl,
              style:new TextStyle(
                fontFamily: 'inline',
                fontSize: 18.0,
                color: Colors.white,
                
              ),
              textAlign: TextAlign.center,
              
              ),
            ),//30,136,169
            new SizedBox(height: 100), 
            new RaisedButton(
              child: Container(
                child: Center(
                  child: new Text(
                      "تسجيل الدخول",
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'buttons'
                      ),
                      
                    ),
                  
                ),
                width: screenWidth/2,
                padding: const EdgeInsets.only(bottom: 10.0),
              ),
              color: Color.fromARGB(255,126, 28, 49),
              onPressed: () { 
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: login_page()));
               },
              padding: const EdgeInsets.all(4.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
            ),
            new SizedBox(height:5.0),
            new RaisedButton(
              child: Container(
                child: Center(
                  child: new Text(
                      "انشاء حساب",
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'buttons'
                      ),
                      
                    ),
                  
                ),
                width: screenWidth/2,
                padding: const EdgeInsets.only(bottom: 10.0),
                
              ),
              color: Color.fromARGB(255,30,136,169),
              onPressed: () { 
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: register_volunteer()));
               },
              padding: const EdgeInsets.all(4.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
            ),
            
        ],),
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [Color.fromARGB(255,245,237,239),Color.fromARGB(255, 107,71,78)], begin: Alignment.topLeft, end: Alignment.bottomRight),

        ),
      ),
          ),
          
    );
  }
}

