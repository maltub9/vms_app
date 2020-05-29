import 'package:athar_app/_basic/DAL.dart';

class Achievments_Log extends DAL {
  int ID;
  int Daily_Log_ID;
  int Amount;
  int Achievment_ID;

  Achievments_Log(
      {this.ID,
      this.Daily_Log_ID,
      this.Amount,
      this.Achievment_ID
      }) {
    tableName = "Achievments_Log";
    columns.add("ID");
    columns.add("Daily_Log_ID");
    columns.add("Amount");
    columns.add("Achievment_ID");
  }

  Achievments_Log.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Daily_Log_ID = json['Daily_Log_ID'],
        Amount = json['Amount'],
        Achievment_ID = json['Achievment_ID'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Daily_Log_ID': '$Daily_Log_ID',
      'Amount': (Amount),
      'Achievment_ID': Achievment_ID
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
