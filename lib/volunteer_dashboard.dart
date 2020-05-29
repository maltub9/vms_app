import 'dart:async';
import 'dart:io';

import 'package:athar_app/register_volunteer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:athar_app/volunteer_dashboard2.dart';

import 'System/Achievments_Log.dart';
import 'System/Daily_Log.dart';
import 'System/Ideas.dart';
import 'System/Opportunity_Volunteers.dart';
import '_basic/Network.dart';
import '_global.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class volunteer_dashboard extends StatefulWidget {
  @override
  _volunteer_dashboardState createState() => _volunteer_dashboardState();
}

class _volunteer_dashboardState extends State<volunteer_dashboard> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  int carosalIndex = 0;
  final List<String> future_imageList = globals.future_opportunitiesImages();
  final List<String> past_imageList = globals.past_opportunitiesImages();
  int widgetIndex = 0;
  TextStyle ts = new TextStyle(fontSize: 18.0, fontFamily: 'inline');
  TextStyle ts2 = new TextStyle(fontSize: 12.0, fontFamily: 'inline');
  TimeOfDay tstart = TimeOfDay.now();
  TimeOfDay tend = TimeOfDay.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String start_time ='اختار وقت الحضور';
  String end_time ='اختار وقت المغادرة';
  bool submit_wait = false;
  bool submit_wait2 = false;

  Future<Null> selectTime(BuildContext context)
  async {
    selectedTime = await showTimePicker(context: context, initialTime: tstart);
  }

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
    
  }

  @override
  Widget build(BuildContext context) {
    globals.screenWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'جمعية اثر الصحية',
          style: ts,
        ),
      ),
      endDrawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text(
                "الرئيسية",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.home,
              ),
              onTap: () {
                widgetIndex = 0;
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "انضمام للفرص التطوعية",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.lightbulb_outline,
              ),
              onTap: () {
                widgetIndex = 1;
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "تسجيل الدوام",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.border_color,
              ),
              onTap: () {
                widgetIndex = 2;
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "ملفي الشخصي",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.note_add,
              ),
              onTap: (){
                widgetIndex = 3; 
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "هل لديك فكرة تطوعية",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.assignment,
              ),
              onTap: (){
                widgetIndex = 4; 
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "الانجازات",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.stars,
              ),
              onTap: (){
                widgetIndex = 5; 
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "فرص تطوعية حالية",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.timer,
              ),
              onTap: (){
                widgetIndex = 6; 
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "فرص تطوعية منتهية",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.timer_off,
              ),
              onTap: (){
                widgetIndex = 7; 
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
            new ListTile(
              title: new Text(
                "اتصل بنا",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.call,
              ),
              onTap: () async {
                const url = 'https://athar.org.sa/%d8%a7%d8%aa%d8%b5%d9%84-%d8%a8%d9%86%d8%a7/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                "خروج",
                textDirection: TextDirection.rtl,
              ),
              trailing: new Icon(
                Icons.close,
              ),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(child: getWidget(widgetIndex)),
    );
  }

  Widget getWidget(int indx) {
    switch (indx) {
      case 0:
        return mainDashboard();
      break;
      case 1:
        return opportunity_registeration();
      break;
      case 2:
        return daily_log();
      break;
      case 3:
        return my_profile();
      break;
      case 4:
        return ideas_profile();
      break;
      case 5:
        return achievments();
      break;
      case 6:
        return future_opportunity();
      break;
      case 7:
        return past_opportunity();
      break;
    }
  }

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final goalsController = TextEditingController();
  final benificaryController = TextEditingController();
  final periodController = TextEditingController();
  final areaController = TextEditingController();
  final targetController = TextEditingController();
  
  Widget future_opportunity()
  {
    List<Widget> components = new List<Widget>();
    BorderSide bs = BorderSide(
                    color: Colors.black,
                    width: 1.0
                );
    components.add(new Text("الفرص التطوعية الحالية",style:ts,textAlign: TextAlign.center,));

    for (var i = 0; i < globals.futureOpportunity.data.length; i++) {
      components.add(
        Center(
          child: new Container(
            decoration: BoxDecoration(
            border: Border(
              left: bs,
                bottom: bs,top:bs,right:bs
            )
        ),
            width: globals.screenWidth*0.9, 
                    child: new Column(
                      children: [
                        new Text(globals.futureOpportunity.data[i]['Title']),
                        new Image.network(future_imageList[i], fit: BoxFit.cover, width: 1000.0),
                        new Table(
                            border: TableBorder.all(),
                            columnWidths: {0: FractionColumnWidth(0.25)},
                            textDirection: TextDirection.rtl,
                            children: [
                              new TableRow(
                                children: [
                                  new Text(
                                    "العدد المطلوب",
                                    textAlign: TextAlign.center,
                                    style: ts2,
                                  ),
                                  new Text(
                                    globals.futureOpportunity.data[i]
                                        ["Volunteer_Limit"],
                                    textAlign: TextAlign.center,
                                    style: ts2,
                                  )
                                ],
                              ),
                              new TableRow(children: [
                                new Text("تبدأ من",
                                    textAlign: TextAlign.center, style: ts2),
                                new Text(
                                    globals.futureOpportunity.data[i]
                                        ["DT_Start"],
                                    textAlign: TextAlign.center,
                                    style: ts2)
                              ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                              new TableRow(children: [
                                new Text("تنتهي في",
                                    textAlign: TextAlign.center, style: ts2),
                                new Text(
                                    globals.futureOpportunity.data[i]
                                        ["DT_Finish"],
                                    textAlign: TextAlign.center,
                                    style: ts2)
                              ]),
                              new TableRow(children: [
                                new Text("وقت النشاط",
                                    textAlign: TextAlign.center, style: ts2),
                                new Text(
                                    globals.tm2string(int.parse(globals.futureOpportunity
                                            .data[i]["TM_Start"])) +
                                        " to " +
                                        globals.tm2string(int.parse(globals
                                            .futureOpportunity
                                            .data[i]["TM_Finish"])),
                                    textAlign: TextAlign.center,
                                    style: ts2)
                              ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                              new TableRow(
                                children: [
                                  new Text("الوصف",
                                      textAlign: TextAlign.center, style: ts2),
                                  new Text(
                                      globals.futureOpportunity.data[i]
                                          ["Description"],
                                      textAlign: TextAlign.center,
                                      style: ts2)
                                ],
                              ),
                            ],
                          )
                          
                      ],
                    ),
          ),
        ));
        components.add(new SizedBox(height:20));
    }

    return new Column(children:components);
  }

  Widget past_opportunity()
  {
    List<Widget> components = new List<Widget>();
    BorderSide bs = BorderSide(
                    color: Colors.black,
                    width: 1.0
                );
    components.add(new Text("الفرص التطوعية المنتهية",style:ts,textAlign: TextAlign.center,));

    for (var i = 0; i < globals.pastOpportunity.data.length; i++) {
      components.add(
        Center(
          child: new Container(
            decoration: BoxDecoration(
            border: Border(
              left: bs,
                bottom: bs,top:bs,right:bs
            )
        ),
            width: globals.screenWidth*0.9, 
                    child: new Column(
                      children: [
                        new Text(globals.pastOpportunity.data[i]['Title']),
                        new Image.network(past_imageList[i], fit: BoxFit.cover, width: 1000.0),
                        new Table(
                            border: TableBorder.all(),
                            columnWidths: {0: FractionColumnWidth(0.25)},
                            textDirection: TextDirection.rtl,
                            children: [
                              new TableRow(
                                children: [
                                  new Text(
                                    "العدد المطلوب",
                                    textAlign: TextAlign.center,
                                    style: ts2,
                                  ),
                                  new Text(
                                    globals.pastOpportunity.data[i]
                                        ["Volunteer_Limit"],
                                    textAlign: TextAlign.center,
                                    style: ts2,
                                  )
                                ],
                              ),
                              new TableRow(children: [
                                new Text("تبدأ من",
                                    textAlign: TextAlign.center, style: ts2),
                                new Text(
                                    globals.pastOpportunity.data[i]
                                        ["DT_Start"],
                                    textAlign: TextAlign.center,
                                    style: ts2)
                              ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                              new TableRow(children: [
                                new Text("تنتهي في",
                                    textAlign: TextAlign.center, style: ts2),
                                new Text(
                                    globals.pastOpportunity.data[i]
                                        ["DT_Finish"],
                                    textAlign: TextAlign.center,
                                    style: ts2)
                              ]),
                              new TableRow(children: [
                                new Text("وقت النشاط",
                                    textAlign: TextAlign.center, style: ts2),
                                new Text(
                                    globals.tm2string(int.parse(globals.pastOpportunity
                                            .data[i]["TM_Start"])) +
                                        " to " +
                                        globals.tm2string(int.parse(globals
                                            .pastOpportunity
                                            .data[i]["TM_Finish"])),
                                    textAlign: TextAlign.center,
                                    style: ts2)
                              ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                              new TableRow(
                                children: [
                                  new Text("الوصف",
                                      textAlign: TextAlign.center, style: ts2),
                                  new Text(
                                      globals.pastOpportunity.data[i]
                                          ["Description"],
                                      textAlign: TextAlign.center,
                                      style: ts2)
                                ],
                              ),
                            ],
                          )
                          
                      ],
                    ),
          ),
        ));
        components.add(new SizedBox(height:20));
    }

    return new Column(children:components);
  }


  Widget achievments()
  {
    List<Widget> components=new List<Widget>();
    List<String> tables = ['حجم الانجاز','معدل حجم الانجاز','عدد الساعات','معدل التقييم'];
    List<TableRow> rows = new List<TableRow>();
    int count = 1,cc=0;
    globals.my_profile_data.split("^^^").forEach((String str1) {
        rows.add(new TableRow(children:[new Text("الفرصة التطوعية",style:ts2,textAlign: TextAlign.center),new Text("القيمة",style:ts2,textAlign: TextAlign.center)],decoration: new BoxDecoration(color: Colors.blueGrey )));

      str1.split(",").forEach((String str2) {
        if(str2.split("|").length==2)
        {
        rows.add(new TableRow(children: []));
        str2.split("|").forEach((String comp) {
          rows[count].children.add(new Text(comp,style: ts2,textAlign: TextAlign.center,));
        });
        count++;
        }
        
       });
       components.add(new Text(tables[cc],style: ts,));
        components.add(new Table(children: rows.toList(),textDirection: TextDirection.rtl, border: TableBorder.all(),));
        components.add(new SizedBox(height:20));
        rows.clear();
        cc++;
        count=1;
     });
    
    return Column(children: components,);
  }

  Widget ideas_profile() {
    
    return new Center(
        child: new Column(
    children: <Widget>[
      new Text(
        "تسجيل الفكرة",
        style: ts,
      ),
      new Container(
          width: globals.screenWidth * 0.9,
          child: new Table(
            border: TableBorder.all(),
            columnWidths: {0: FractionColumnWidth(0.25)},
            textDirection: TextDirection.rtl,
            children: [
              new TableRow(children: [
                new Text(
                  "العنوان",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: titleController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'العنوان',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              new TableRow(children: [
                new Text(
                  "شرح موجز",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: descriptionController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'شرح موجز',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              new TableRow(children: [
                new Text(
                  "اهداف الفكرة",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: goalsController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'اهداف الفكرة',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              new TableRow(children: [
                new Text(
                  "المستفيدين",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: benificaryController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'المستفيدين',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              new TableRow(children: [
                new Text(
                  "المدة المقترحة",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: periodController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'المدة المقترحة',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              new TableRow(children: [
                new Text(
                  "مجال الفكرة",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: targetController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'مجال الفكرة',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              new TableRow(children: [
                new Text(
                  "المنطقة",
                  textAlign: TextAlign.center,
                  style: ts2,
                ),
                new TextField(
            obscureText: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            controller: areaController,
            decoration: InputDecoration.collapsed(
              border: OutlineInputBorder(),
              hintText: 'المنطقة',
            ),
          ),
              ], decoration: new BoxDecoration(color: Colors.white )),
              
            ],
          )
          ),
          
          if(!submit_wait2)
      new RaisedButton(
        child: new Text(
          "تسجيل الفكرة",
          style: ts2,
        ),
        onPressed: () async {
          if(submit_wait2)
            return;
            setState(() {
              submit_wait2=true;
            });
          
          

          //globals.achievments_controller
          Ideas idea = new Ideas();
          idea.Area=areaController.text;
          idea.Benificary=benificaryController.text;
          idea.Description=descriptionController.text;
          idea.Goals=goalsController.text;
          idea.Period=periodController.text;
          idea.Target=targetController.text;
          idea.Title=titleController.text;
          idea.Volunteer_Username=globals.logedVolunteer.data[0]['UserName'];

          idea.addRow();
          await idea.updateCurrent();
          int xy = 0;
          setState(() {
              submit_wait2=false;
            });

          showInSnackBar("تم تسجيل الفكرة");

          widgetIndex = 0;
          setState(() {
            
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Color.fromARGB(255, 30, 136, 169),
      )
      else
      SpinKitRotatingCircle(
        color: Colors.blueGrey,
        size: 50.0,
      )
    ],
        ),
      );
  }


  Widget my_profile()
  {
    return new Column(
      children: [
        globals.logedVolunteer.get_row_as_table(0,globals.logedVolunteer.columns_caption),
        new SizedBox(height: 20,),
        new RaisedButton(
              child: new Text(
                "تعديل الملف",
                style: ts2,
              ),
              onPressed: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: register_volunteer()));
              },
              )
      ],
    );
  }

  Widget daily_log() {
    
    return ModalProgressHUD(
          inAsyncCall: submit_wait,
          progressIndicator: CircularProgressIndicator(backgroundColor: Colors.amberAccent,),
          color: Colors.amberAccent,
          opacity: 200,
          child: new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              "تسجيل الدوام",
              style: ts,
            ),
            new Container(
                width: globals.screenWidth * 0.9,
                child: new Table(
                  border: TableBorder.all(),
                  columnWidths: {0: FractionColumnWidth(0.25)},
                  textDirection: TextDirection.rtl,
                  children: [
                    new TableRow(children: [
                      new Text(
                        "موعد الحضور",
                        textAlign: TextAlign.center,
                        style: ts2,
                      ),
                      new RaisedButton(onPressed: () async {
                        await selectTime(context);
                        tstart = selectedTime;
                        start_time = selectedTime.hour.toString().padLeft(2,'0') + ":" + selectedTime.minute.toString().padLeft(2,'0');
                        setState(() {
                          
                        });
                      },child:new Text("$start_time")),
                    ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                    new TableRow(children: [
                      new Text(
                        "موعد المغادرة",
                        textAlign: TextAlign.center,
                        style: ts2,
                      ),
                      new RaisedButton(onPressed: () async {
                        await selectTime(context);
                        tend = selectedTime;
                        end_time = selectedTime.hour.toString().padLeft(2,'0') + ":" + selectedTime.minute.toString().padLeft(2,'0');
                        setState(() {
                          
                        });
                      },child:new Text("$end_time")),
                    ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                    
                  ],
                )),
                new Container(child:globals.ach,width: globals.screenWidth * 0.9,),
                if(!submit_wait)
            new RaisedButton(
              child: new Text(
                "تسجيل الدوام",
                style: ts2,
              ),
              onPressed: () async {
                if(submit_wait)
                  return;
                  setState(() {
                    submit_wait=true;
                  });
                
                
                List<int> ach_vals=new List<int>();
                //for each achievments controller get value
                int sum=0;
                for (var i = 0; i < globals.achievments.data.length; i++) {
                  int x = int.parse(globals.achievments_controller[i].text);
                  sum+=x;
                  ach_vals.add(x);
                }
                //assign value to list of achievment titles
                //then collect total and assign it to achievment total in daily log.
                

                //globals.achievments_controller
                Daily_Log dl = new Daily_Log();
                dl.TM_Start= globals.tm2int(tstart);
                dl.TM_Finish= globals.tm2int(tend);
                dl.Opportunity_ID=globals.volunteer_op;
                dl.Team_ID=globals.volunteer_team_id;
                dl.Achievment_Count=sum;
                dl.Volunteer_Username=globals.logedVolunteer.data[0]['UserName'].toString();
                dl.addRow();
                await dl.updateCurrent();
                //loop again submit every non zero value to the achievment_log table.
                String dl_id = await dl.get_value("SELECT MAX(\"ID\") FROM \"Daily_Log\" WHERE \"Volunteer_Username\"='" + globals.logedVolunteer.data[0]['UserName'].toString() + "'");
                
                for (var i = 0; i < globals.achievments.data.length; i++) {
                  if(ach_vals[i]>0)
                  {
                    Achievments_Log al = new Achievments_Log();
                    al.Daily_Log_ID = int.parse(dl_id);
                    al.Achievment_ID = int.parse(globals.achievments.data[i]["ID"]);
                    al.Amount=ach_vals[i];
                    al.addRow();
                    await al.updateCurrent();
                  }
                }

                setState(() {
                    submit_wait=false;
                  });

                showInSnackBar("تم تسجيل الدوام");

                widgetIndex = 0;
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Color.fromARGB(255, 30, 136, 169),
            )
            else
            SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

  Widget opportunity_registeration() {
    if (globals.volunteerPendingRegisteration)
      return new Center(
          child: new Column(
        children: <Widget>[new Text("يوجد طلب تحت الموافقه يرجى الانتظار")],
      ));
    return new Center(
      child: new Column(
        children: <Widget>[
          new Text(
            "انضمام الى الفرص",
            style: ts,
          ),
          GFCarousel(
            items: future_imageList.map(
              (url) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
                  ),
                );
              },
            ).toList(),
            onPageChanged: (index) {
              setState(() {
                carosalIndex = index;
              });
            },
          ),
          new Container(
              width: globals.screenWidth * 0.9,
              child: new Table(
                border: TableBorder.all(),
                columnWidths: {0: FractionColumnWidth(0.25)},
                textDirection: TextDirection.rtl,
                children: [
                  new TableRow(children: [
                    new Text(
                      "اسم الفرصة",
                      textAlign: TextAlign.center,
                      style: ts2,
                    ),
                    new Text(
                      globals.futureOpportunity.data[carosalIndex]["Title"],
                      textAlign: TextAlign.center,
                      style: ts2,
                    ),
                  ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                  new TableRow(
                    children: [
                      new Text(
                        "العدد المطلوب",
                        textAlign: TextAlign.center,
                        style: ts2,
                      ),
                      new Text(
                        globals.futureOpportunity.data[carosalIndex]
                            ["Volunteer_Limit"],
                        textAlign: TextAlign.center,
                        style: ts2,
                      )
                    ],
                  ),
                  new TableRow(children: [
                    new Text("تبدأ من",
                        textAlign: TextAlign.center, style: ts2),
                    new Text(
                        globals.futureOpportunity.data[carosalIndex]
                            ["DT_Start"],
                        textAlign: TextAlign.center,
                        style: ts2)
                  ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                  new TableRow(children: [
                    new Text("تنتهي في",
                        textAlign: TextAlign.center, style: ts2),
                    new Text(
                        globals.futureOpportunity.data[carosalIndex]
                            ["DT_Finish"],
                        textAlign: TextAlign.center,
                        style: ts2)
                  ]),
                  new TableRow(children: [
                    new Text("وقت النشاط",
                        textAlign: TextAlign.center, style: ts2),
                    new Text(
                        globals.tm2string(int.parse(globals.futureOpportunity
                                .data[carosalIndex]["TM_Start"])) +
                            " to " +
                            globals.tm2string(int.parse(globals
                                .futureOpportunity
                                .data[carosalIndex]["TM_Finish"])),
                        textAlign: TextAlign.center,
                        style: ts2)
                  ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                  new TableRow(
                    children: [
                      new Text("الوصف",
                          textAlign: TextAlign.center, style: ts2),
                      new Text(
                          globals.futureOpportunity.data[carosalIndex]
                              ["Description"],
                          textAlign: TextAlign.center,
                          style: ts2)
                    ],
                  ),
                ],
              )),
          new RaisedButton(
            child: new Text(
              "تسجيل انضمام",
              style: ts2,
            ),
            onPressed: () {
              Opportunity_Volunteers ov = new Opportunity_Volunteers();
              ov.Opportunity_ID =
                  int.parse(globals.futureOpportunity.data[carosalIndex]["ID"]);
              ov.Volunteer_Username =
                  globals.logedVolunteer.data[0]["UserName"].toString();
              ov.addRow();
              ov.updateCurrent();
              globals.volunteerPendingRegisteration = true;
              widgetIndex = 0;

              showInSnackBar("تم الانضمام");
              setState(() {});
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: Color.fromARGB(255, 30, 136, 169),
          )
        ],
      ),
    );
  }

  Widget mainDashboard() {
    return new Center(
      child: new Container(
        width: globals.screenWidth,
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 10,
            ),
            Container(
              width: globals.screenWidth * 0.9,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "الفرص الحالية",
                            style: ts,
                          ),
                          new Text("4", style: ts)
                        ],
                      ),
                      width: globals.screenWidth * 0.4,
                      height: globals.screenWidth * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: new DecorationImage(
                          image: NetworkImage(
                              'https://flutter01.com/VMSX/icons/opportunity.png'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 10),
                        ],
                      )),
                  new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "الفرص المنتهية",
                            style: ts,
                          ),
                          new Text("11", style: ts)
                        ],
                      ),
                      width: globals.screenWidth * 0.4,
                      height: globals.screenWidth * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: new DecorationImage(
                          image: NetworkImage(
                              'https://flutter01.com/VMSX/icons/past_opportunity.png'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 10),
                        ],
                      )),
                ],
              ),
            ),
            new SizedBox(height: globals.screenWidth * 0.1),
            Container(
              width: globals.screenWidth * 0.9,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "المتطوعين",
                            style: ts,
                          ),
                          new Text("45", style: ts)
                        ],
                      ),
                      width: globals.screenWidth * 0.4,
                      height: globals.screenWidth * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: new DecorationImage(
                          image: NetworkImage(
                              'https://flutter01.com/VMSX/icons/volunteer.png'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 10),
                        ],
                      )),
                  new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "ساعات التطوع",
                            style: ts,
                          ),
                          new Text("165", style: ts)
                        ],
                      ),
                      width: globals.screenWidth * 0.4,
                      height: globals.screenWidth * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: new DecorationImage(
                          image: NetworkImage(
                              'https://flutter01.com/VMSX/icons/hours.png'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 5,
                              blurRadius: 10),
                        ],
                      )),
                ],
              ),
            ),
            new SizedBox(height: globals.screenWidth * 0.1),
            GFCarousel(
              items: future_imageList.map(
                (url) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child:
                          Image.network(url, fit: BoxFit.cover, width: 1000.0),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  carosalIndex = index;
                });
              },
            ),
            new Container(
                width: globals.screenWidth * 0.9,
                child: new Table(
                  border: TableBorder.all(),
                  columnWidths: {0: FractionColumnWidth(0.25)},
                  textDirection: TextDirection.rtl,
                  children: [
                    new TableRow(children: [
                      new Text(
                        "اسم الفرصة",
                        textAlign: TextAlign.center,
                        style: ts2,
                      ),
                      new Text(
                        globals.futureOpportunity.data[carosalIndex]["Title"],
                        textAlign: TextAlign.center,
                        style: ts2,
                      ),
                    ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                    new TableRow(
                      children: [
                        new Text(
                          "العدد المطلوب",
                          textAlign: TextAlign.center,
                          style: ts2,
                        ),
                        new Text(
                          globals.futureOpportunity.data[carosalIndex]
                              ["Volunteer_Limit"],
                          textAlign: TextAlign.center,
                          style: ts2,
                        )
                      ],
                    ),
                    new TableRow(children: [
                      new Text("تبدأ من",
                          textAlign: TextAlign.center, style: ts2),
                      new Text(
                          globals.futureOpportunity.data[carosalIndex]
                              ["DT_Start"],
                          textAlign: TextAlign.center,
                          style: ts2)
                    ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                    new TableRow(children: [
                      new Text("تنتهي في",
                          textAlign: TextAlign.center, style: ts2),
                      new Text(
                          globals.futureOpportunity.data[carosalIndex]
                              ["DT_Finish"],
                          textAlign: TextAlign.center,
                          style: ts2)
                    ]),
                    new TableRow(children: [
                      new Text("وقت النشاط",
                          textAlign: TextAlign.center, style: ts2),
                      new Text(
                          globals.tm2string(int.parse(globals.futureOpportunity
                                  .data[carosalIndex]["TM_Start"])) +
                              " to " +
                              globals.tm2string(int.parse(globals
                                  .futureOpportunity
                                  .data[carosalIndex]["TM_Finish"])),
                          textAlign: TextAlign.center,
                          style: ts2)
                    ], decoration: new BoxDecoration(color: Colors.lightBlue)),
                    new TableRow(
                      children: [
                        new Text("الوصف",
                            textAlign: TextAlign.center, style: ts2),
                        new Text(
                            globals.futureOpportunity.data[carosalIndex]
                                ["Description"],
                            textAlign: TextAlign.center,
                            style: ts2)
                      ],
                    ),
                  ],
                ))
          ],
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [
            Color.fromARGB(255, 113, 173, 192),
            Color.fromARGB(255, 254, 254, 254)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
