import 'package:athar_app/_basic/DAL.dart';

class Opportunity extends DAL {
  int ID;
  String Title;
  String Volunteer_Limit;
  String TM_Start;
  String TM_Finish;
  String Charity_ID;
  String Opportunity_Type;
  String Description;
  String Achievment_Count;
  String Program_ID;
  DateTime DT_Start;
  DateTime DT_Finish;
  

  Opportunity(
      {this.ID,
      this.Title,
      this.Volunteer_Limit,
      this.TM_Start,
      this.TM_Finish,
      this.Charity_ID,
      this.Opportunity_Type,
      this.Description,
      this.Achievment_Count,
      this.Program_ID,
      this.DT_Start,
      this.DT_Finish,
      }) {
    tableName = "Opportunity";
    columns.add("ID");
    columns.add("Title");
    columns.add("Volunteer_Limit");
    columns.add("TM_Start");
    columns.add("TM_Finish");
    columns.add("Charity_ID");
    columns.add("Opportunity_Type");
    columns.add("Description");
    columns.add("Achievment_Count");
    columns.add("Program_ID");
    columns.add("DT_Start");
    columns.add("DT_Finish");
  }

  Opportunity.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Title = json['Title'],
        Volunteer_Limit = json['Volunteer_Limit'],
        TM_Start = json['TM_Start'],
        TM_Finish = json['TM_Finish'],
        Charity_ID = json['Charity_ID'],
        Opportunity_Type = json['Opportunity_Type'],
        Description = json['Description'],
        Achievment_Count = json['Achievment_Count'],
        Program_ID = json['Program_ID'],
        DT_Start = json['DT_Start'],
        DT_Finish = json['DT_Finish'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Title': '$Title',
      'Volunteer_Limit': '$Volunteer_Limit',
      'TM_Start': TM_Start,
      'TM_Finish': TM_Finish,
      'Charity_ID': Charity_ID,
      'Opportunity_Type':Opportunity_Type,
      'Description':Description,
      'Achievment_Count':Achievment_Count,
      'Program_ID':Program_ID,
      'DT_Start':shortDate(DT_Start),
      'DT_Finish':shortDate(DT_Finish),
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
