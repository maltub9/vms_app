library athar_app.globals;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:athar_app/System/Volunteer.dart';

import 'System/Achievments_Components.dart';
import 'System/Opportunity.dart';

String toArabic(String txt)
{
  return utf8.decode( txt.runes.toList());
}

var logedVolunteer = new  Volunteer();
var registerVolunteer = new  Volunteer();
var futureOpportunity = new Opportunity();
var pastOpportunity = new Opportunity();
var achievments = new Achievments_Components();
int volunteer_op = 0;
int volunteer_team_id = 0;
List<Widget> achievments_List=new List<Widget>();
List<TextEditingController> achievments_controller=new List<TextEditingController>();
double screenWidth = 0;
double screenHeight = 0;
var url = "https://flutter01.com/VMSX/opportunity_images/";
int selectedCategory = 0;
Map<int,Widget> widgets=new Map<int,Widget>();
bool volunteerPendingRegisteration = false;
Table ach;
TextStyle ts2 = new TextStyle(fontSize: 12.0, fontFamily: 'inline');
String my_profile_data = "";

Future<void> initializeWidgets()
async {
  await achievments.search("\"ID\">0");
  for (var i = 0; i < achievments.data.length; i++) {
    achievments_controller.add(new TextEditingController());
    achievments_List.add(new TextField(
      keyboardType: TextInputType.number,
      obscureText: false,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  controller: achievments_controller[i],
                  decoration: InputDecoration.collapsed(
                    border: OutlineInputBorder(),
                    hintText: achievments.data[i]["Title"].toString(),
                  ),
    ));
  }
  ach = achievmentsForm();
}

Widget achievmentsForm()
{
  Table t = new Table(children: new List<TableRow>(),columnWidths: {0: FractionColumnWidth(0.25)},
                textDirection: TextDirection.rtl,
                border: TableBorder.all(),
                
                );

  for (var i = 0; i < achievments.data.length; i++) {
    TableRow tr=new TableRow(children: new List<Widget>(),decoration: new BoxDecoration(color: Colors.amberAccent));
    String title =achievments.data[i]["Title"];
    Text txt = new Text(title,textAlign: TextAlign.center,
                      style: ts2,);
    tr.children.add(txt);
    tr.children.add(achievments_List[i]);
    t.children.add(tr);
  }

  return t;
}


List<String> future_opportunitiesImages()
{
  List<String> result = new List<String>();

  for (var i = 0; i < futureOpportunity.data.length; i++) {
    result.add(url + futureOpportunity.data[i]["ID"].toString() + "_0.png");
  }

  return result;
}

List<String> past_opportunitiesImages()
{
  List<String> result = new List<String>();

  for (var i = 0; i < pastOpportunity.data.length; i++) {
    result.add(url + pastOpportunity.data[i]["ID"].toString() + "_0.png");
  }

  return result;
}

String tm2string(int tm)
{

  int hours = (tm~/60).toInt();

  int minutes = tm - hours *60;

  return hours.toString().padLeft(2,'0')+":"+minutes.toString().padLeft(2,'0');
}

int tm2int(TimeOfDay tod)
{
  return tod.hour * 60 + tod.minute;
}