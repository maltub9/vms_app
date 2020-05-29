import 'package:athar_app/_basic/DAL.dart';

class Daily_Log extends DAL {
  int ID;
  String Volunteer_Username;
  DateTime DT;
  int TM_Start;
  int TM_Finish;
  int Rank;
  int Opportunity_ID;
  String Level1_Approval;
  String Level2_Approval;
  int Achievment_Count;
  String Level1_Comment;
  String Level2_Comment;
  String Absence_Type;
  int Team_ID;

  Daily_Log(
      {this.ID,
      this.Volunteer_Username,
      this.DT,
      this.TM_Start,
      this.TM_Finish,
      this.Rank,
      this.Opportunity_ID,
      this.Level1_Approval,
      this.Level2_Approval,
      this.Achievment_Count,
      this.Level1_Comment,
      this.Level2_Comment,
      this.Absence_Type,
      this.Team_ID
      }) {
    tableName = "Daily_Log";
    columns.add("ID");
    columns.add("Volunteer_Username");
    columns.add("DT");
    columns.add("TM_Start");
    columns.add("TM_Finish");
    columns.add("Rank");
    columns.add("Opportunity_ID");
    columns.add("Level1_Approval");
    columns.add("Level2_Approval");
    columns.add("Achievment_Count");
    columns.add("Level1_Comment");
    columns.add("Level2_Comment");
    columns.add("Absence_Type");
    columns.add("Team_ID");
    columns.add("District");
  }

  Daily_Log.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Volunteer_Username = json['Volunteer_Username'],
        DT = json['DT'],
        TM_Start = json['TM_Start'],
        TM_Finish = json['TM_Finish'],
        Rank = json['Rank'],
        Opportunity_ID = json['Opportunity_ID'],
        Level1_Approval = json['Level1_Approval'],
        Level2_Approval = json['Level2_Approval'],
        Achievment_Count = json['Achievment_Count'],
        Level1_Comment = json['Level1_Comment'],
        Level2_Comment = json['Level2_Comment'],
        Absence_Type = json['Absence_Type'],
        Team_ID = json['Team_ID'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Volunteer_Username': '$Volunteer_Username',
      'DT': shortDate(DT),
      'TM_Start': TM_Start,
      'TM_Finish': TM_Finish,
      'Rank': Rank,
      'Opportunity_ID':Opportunity_ID,
      'Level1_Approval':Level1_Approval,
      'Level2_Approval':Level2_Approval,
      'Achievment_Count':Achievment_Count,
      'Level1_Comment':(Level1_Comment),
      'Level2_Comment':(Level2_Comment),
      'Absence_Type':Absence_Type,
      'Team_ID':Team_ID
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
