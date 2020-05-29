import 'package:athar_app/_basic/DAL.dart';

class Volunteer extends DAL {
  int ID;
  String Name;
  String UserName;
  String PassWord;
  String Mobile;
  String Email;
  String Country;
  String City;
  String Qualification;
  String Sex;
  DateTime DT_Birth;
  DateTime Register_DT;
  String National_ID;
  String Area;
  String District;
  String Academic;
  String Job;
  String Job_Detail;
  String Volunteer_Chance;
  String Volunteer_Preferred_Time;
  String Preferred_Days;
  String Opportunity_Type;
  String Social_State;
  String Blood_Type;
  String Temp_Disease;
  String Special_Need;
  String Emergency_Mobile;
  String Twitter;
  String LinkedIN;
  String Concerns;

  Map<String,String> columns_caption=new Map<String,String>();


  Volunteer(
      {this.ID,
      this.Name,
      this.UserName,
      this.PassWord,
      this.Mobile,
      this.Email,
      this.Country,
      this.City,
      this.Qualification,
      this.Sex,
      this.DT_Birth,
      this.Register_DT,
      this.National_ID,
      this.Area,
      this.District,
      this.Academic,
      this.Job,
      this.Job_Detail,
      this.Volunteer_Chance,
      this.Volunteer_Preferred_Time,
      this.Preferred_Days,
      this.Opportunity_Type,
      this.Social_State,
      this.Blood_Type,
      this.Temp_Disease,
      this.Special_Need,
      this.Emergency_Mobile,
      this.Twitter,
      this.LinkedIN,
      this.Concerns
      }) {
    tableName = "Volunteer";
    columns.add("ID");
    columns.add("Name");
    columns.add("UserName");
    columns.add("PassWord");
    columns.add("Mobile");
    columns.add("Email");
    columns.add("Country");
    columns.add("City");
    columns.add("Qualification");
    columns.add("Sex");
    columns.add("DT_Birth");
    columns.add("Register_DT");
    columns.add("National_ID");
    columns.add("Area");
    columns.add("District");
    columns.add("Academic");
    columns.add("Job");
    columns.add("Job_Detail");
    columns.add("Volunteer_Chance");
    columns.add("Volunteer_Preferred_Time");
    columns.add("Preferred_Days");
    columns.add("Opportunity_Type");
    columns.add("Social_State");
    columns.add("Blood_Type");
    columns.add("Temp_Disease");
    columns.add("Special_Need");
    columns.add("Emergency_Mobile");
    columns.add("Twitter");
    columns.add("LinkedIN");
    columns.add("Concerns");

    	columns_caption["ID"] = "الرقم";
    columns_caption["Name"] = "الاسم";
    columns_caption["UserName"] = "اسم المستخدم";
    columns_caption["PassWord"] = "كلمة السر";
    columns_caption["Mobile"] = "الموبايل";
    columns_caption["Email"] = "الايميل";
    columns_caption["Country"] = "الدولة";
    columns_caption["City"] = "المدينة";
    columns_caption["Qualification"] = "المؤهلات";
    columns_caption["Sex"] = "الجنس";
    columns_caption["DT_Birth"] = "تاريخ الميلاد";
    columns_caption["Register_DT"] = "تاريخ التسجيل";
    columns_caption["National_ID"] = "رقم الهوية";
    columns_caption["Area"] = "المنطقة";
    columns_caption["District"] = "الحي";
    columns_caption["Academic"] = "التحصيل الاكاديمي";
    columns_caption["Job"] = "الوظيفة";
    columns_caption["Job_Detail"] = "تفاصيل الوظيفة";
    columns_caption["Volunteer_Chance"] = "الفرص التطوعية";
    columns_caption["Volunteer_Preferred_Time"] = "الوقت المفضل";
    columns_caption["Preferred_Days"] = "الايام المفضلة";
    columns_caption["Opportunity_Type"] = "نوع الفرصة";
    columns_caption["Social_State"] = "الحالة الاجتماعية";
    columns_caption["Blood_Type"] = "فصيلة الدم";
    columns_caption["Temp_Disease"] = "امراض مزمنة";
    columns_caption["Special_Need"] = "احتياجات خاصة";
    columns_caption["Emergency_Mobile"] = "هاتف الطوارئ";
    columns_caption["Twitter"] = "تويتر";
    columns_caption["LinkedIN"] = "لينكدأن";
    columns_caption["Concerns"] = "الاهتمامات";
  }

  

  Volunteer.fromJson(Map<String, dynamic> json)
      : ID = int.parse(json['ID']),
        Name = json['Name'],
        UserName = json['UserName'],
        PassWord = json['PassWord'],
        Mobile = json['Mobile'],
        Email = json['Email'],
        Country = json['Country'],
        City = json['City'],
        Qualification = json['Qualification'],
        Sex = json['Sex'],
        DT_Birth = json['DT_Birth'],
        Register_DT = json['Register_DT'],
        National_ID = json['National_ID'],
        Area = json['Area'],
        District = json['District'],
        Academic = json['Academic'],
        Job = json['Job'],
        Job_Detail = json['Job_Detail'],
        Volunteer_Chance = json['Volunteer_Chance'],
        Volunteer_Preferred_Time = json['Volunteer_Preferred_Time'],
        Preferred_Days = json['Preferred_Days'],
        Opportunity_Type = json['Opportunity_Type'],
        Social_State = json['Social_State'],
        Blood_Type = json['Blood_Type'],
        Temp_Disease = json['Temp_Disease'],
        Special_Need = json['Special_Need'],
        Emergency_Mobile = json['Emergency_Mobile'],
        Twitter = json['Twitter'],
        LinkedIN = json['LinkedIN'],
        Concerns = json['Concerns'];

  Map<String, dynamic> toJson() {
    return {
      'ID': ID.toString(),
      'Name': '$Name',
      'UserName': '$UserName',
      'PassWord': PassWord,
      'Mobile': Mobile,
      'Email': Email,
      'Country':Country,
      'City':City,
      'Qualification':Qualification,
      'Sex':Sex,
      'DT_Birth':shortDate(DT_Birth),
      'Register_DT':shortDate(Register_DT),
      'National_ID':National_ID,
      'Area':Area,
      'District':District,
      'Academic':Academic,
      'Job':Job,
      'Job_Detail':Job_Detail,
      'Volunteer_Chance':Volunteer_Chance,
      'Volunteer_Preferred_Time':Volunteer_Preferred_Time,
      'Preferred_Days':Preferred_Days,
      'Opportunity_Type':Opportunity_Type,
      'Social_State':Social_State,
      'Blood_Type':Blood_Type,
      'Temp_Disease':Temp_Disease,
      'Special_Need':Special_Need,
      'Emergency_Mobile':Emergency_Mobile,
      'Twitter':Twitter,
      'LinkedIN':LinkedIN,
      'Concerns':Concerns
    };
  }

  Function addRow()
  {
    int pos = data.length;
    data[pos]=toJson();
  }

}
