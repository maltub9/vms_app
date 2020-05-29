import 'package:athar_app/_basic/DAL.dart';

class Opportunity_Volunteers extends DAL {
  int ID;
  String Volunteer_Username;
  int Opportunity_ID;
  String Is_Approved;
  int Team_ID;
  

  Opportunity_Volunteers(
      {this.ID,
      this.Volunteer_Username,
      this.Opportunity_ID,
      this.Is_Approved,
      this.Team_ID
      }) {
    tableName = "Opportunity_Volunteers";
    columns.add("ID");
    columns.add("Volunteer_Username");
    columns.add("Opportunity_ID");
    columns.add("Is_Approved");
    columns.add("Team_ID");
  }

  Opportunity_Volunteers.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Volunteer_Username = json['Volunteer_Username'],
        Opportunity_ID = json['Opportunity_ID'],
        Is_Approved = json['Is_Approved'],
        Team_ID = json['Team_ID'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Volunteer_Username': '$Volunteer_Username',
      'Opportunity_ID': '$Opportunity_ID',
      'Is_Approved': Is_Approved,
      'Team_ID': Team_ID
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
