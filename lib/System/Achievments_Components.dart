import 'package:athar_app/_basic/DAL.dart';

class Achievments_Components extends DAL {
  int ID;
  String Title;
  bool Component_Status;
  

  Achievments_Components(
      {
        this.ID,
        this.Title,
        this.Component_Status,
      }) {
    tableName = "Achievments_Components";
    columns.add("ID");
    columns.add("Title");
    columns.add("Component_Status");
  }

  Achievments_Components.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Title = json['Title'],
        Component_Status = json['Component_Status'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Title': '$Title',
      'Component_Status': '$Component_Status'
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
