
import 'dart:convert';
import 'package:flutter/material.dart';

import '../_global.dart';
import 'Network.dart';

class DAL
{
  String _tn="";
  
  String tableName="";
  String errorMessage = "";
  List<String> columns = new List<String>();
  int rowCount = 0;
  int cursor=-1;
  String host = "https://www.flutter01.com/VMSX/dl_host";

  Map<int,Map<String,dynamic>> data = new Map<int,Map<String,dynamic>>();
  DAL();

  Future<bool> updateCurrent()
  async {
    String url = host + "/data_submit.php?table_name=" + tableName + "&status=update";
    Network n = new Network(url);
    String result = await n.sendData(data[0]);
    print(result);
    if(result.trim() == "success")
      return true;
    else
    {
      errorMessage=result.toString();
      return false;
    }
  }

  String shortDate(DateTime now)
  {
    if(now !=null)
      return "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
    else
      return null;
  }

  Function clearData(){data.clear();}

  Future<bool> update(Map datax)
  async {
    Network n = new Network(host + "/data_submit.php?table_name=" + tableName + "&status=update");

    String result = await n.sendData(datax);
    return (result.trim() == "updated");
  }

  Future<bool> updateConditional(Map datax,String cond)
  async {
    Network n = new Network(host + "/data_submit.php?table_name=" + tableName + "&status=update&cond=" + cond);

    String result = await n.sendData(datax);
    return (result.trim() == "updated");
  }

  Future<Map<int,String>> updateAll()
  async {
    Map<int,String> executionResult=new Map<int,String>();

    for (var i = 0; i < data.length; i++) {
      Map datax = data[i];
      Network n = new Network(host + "/data_submit.php?table_name=" + tableName + "&status=update");

      String result = '';
      while(result=='')
      {
        result = await n.sendData(datax);
      }
      //
      executionResult.putIfAbsent(i, () => result.trim());
    }

    return executionResult;

  }
  
  Future<String> get_value(String query)
  async {
    Network n = new Network(host + "/get_value.php?query=" + query);
    String result = await n.getData();
    //print('search query ' + query);
    return result;  
    
  }

  Future<void> search(String cond)
  async {
    Network n = new Network(host + "/get_datax.php?table_name=" + tableName + "&cond=" + cond);
    String result = await n.getData();
    //print('search result ' + result);
    if(result == "no data") return;
    cursor=0;
    Map<String, dynamic> js = jsonDecode(toArabic(result));

    for (var i = 0; i < js[tableName].length; i++) 
    {
      //List<Object> vals = new List<Object>();
      Map<String,dynamic> vals = new Map<String,dynamic>();
      rowCount++;
      for (var j = 0; j < js[tableName][i].length; j++) {
        //vals.add(js[tableName][i][columns[j]]);
        vals[columns[j]]=js[tableName][i][columns[j]];
      }
      data[i]=vals;
    }
  }

  Widget get_row_as_table(int rowID,Map<String,String> captions)
  {
    Table t = new Table(children: new List<TableRow>(),columnWidths: {0: FractionColumnWidth(0.25)},
                textDirection: TextDirection.rtl,
                border: TableBorder.all(),
                
                );

    for (var i = 0; i < data[rowID].length; i++) {
      TableRow tr=new TableRow(children: new List<Widget>(),decoration: new BoxDecoration(color: Colors.amberAccent));
      String tx ="";
      if(captions==null)
        tx = data[rowID].keys.toList()[i];
      else
        tx = captions[data[rowID].keys.toList()[i]];
      
      Text txt = new Text(tx,textAlign: TextAlign.center,
                      style: ts2,);
      tr.children.add(txt);
      txt = new Text(data[rowID].values.toList()[i].toString(),textAlign: TextAlign.center,
                      style: ts2,);
      tr.children.add(txt);
      t.children.add(tr);
    }

    return t;
  }
}
//************************ if necessary ******************* */
//Map<String, dynamic> map = json.decode(response.body);
//List<dynamic> data = data["dataKey"];
//print(data[0]["name"]);