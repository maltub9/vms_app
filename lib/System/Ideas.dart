import 'package:athar_app/_basic/DAL.dart';

class Ideas extends DAL {
  int ID;
  String Title;
  String Description;
  String Goals;
  String Benificary;
  String Period;
  String Area	;
  String Target;
  String Volunteer_Username;
  DateTime DT;
  
  Map<String,String> columns_caption=new Map<String,String>();


  Ideas(
      {this.ID,
      this.Title,
      this.Description,
      this.Goals,
      this.Benificary,
      this.Period,
      this.Area	,
      this.Target,
      this.Volunteer_Username,
      this.DT
      }) {
    tableName = "Ideas";
    columns.add("ID");
    columns.add("Title");
    columns.add("Description");
    columns.add("Goals");
    columns.add("Benificary");
    columns.add("Period");
    columns.add("Area");
    columns.add("Target");
    columns.add("Volunteer_Username");
    columns.add("DT");
    

    columns_caption["ID"] = "الرقم";
    columns_caption["Title"] = "الاسم";
    columns_caption["Description"] = "اسم المستخدم";
    columns_caption["Goals"] = "كلمة السر";
    columns_caption["Benificary"] = "الموبايل";
    columns_caption["Period"] = "الايميل";
    columns_caption["Area"] = "الدولة";
    columns_caption["Target"] = "المدينة";
    columns_caption["Volunteer_Username"] = "المؤهلات";
    columns_caption["DT"] = "تاريخ الميلاد";
  }

  

  Ideas.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Title = json['Title'],
        Description = json['Description'],
        Goals = json['Goals'],
        Benificary = json['Benificary'],
        Period = json['Period'],
        Area	 = json['Area'],
        Target = json['Target'],
        Volunteer_Username = json['Volunteer_Username'],
        DT = json['DT'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Title': '$Title',
      'Description': '$Description',
      'Goals': Goals,
      'Benificary': Benificary,
      'Period': Period,
      'Area':Area	,
      'Target':Target,
      'Volunteer_Username':Volunteer_Username,
      'DT':shortDate(DT)
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
