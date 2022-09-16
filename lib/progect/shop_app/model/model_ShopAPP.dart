
/*{
    "status": true,
    "message": "تم تسجيل الدخول بنجاح",
    "data": {
        "id": 16905,
        "name": "hamdii",
        "email": "ahmedd01150@gmail.com",
        "phone": "01144015561",
        "image": "https://student.valuxapps.com/storage/uploads/users/E65vLfZ8ol_1659106357.jpeg",
        "points": 0,
        "credit": 0,
        "token": "2PCalTL1VPqzowpiPQdKGlkqUZ8niDrgoVcU5RN6dpvsxX2YQMTOlBk4sul0bkDUNocpcp"
    }
}*/
class ShopLogintModel
{
 bool? status;
 String? message;
   UserData? data ;

 ShopLogintModel.fromJson(Map<String, dynamic> json) {
      status= json["status"];
      message= json["message"];
   /*   data = UserData.fromJson(json["data"]);*/
      data=json["data"] !=null ? UserData.fromJson(json["data"]):null;

  }
//

}
class UserData{
  int? id;
   String? name;
  String? email;
  String ?phone;
  String ?image;
  int? points;
  int? credit;
  String? token;

   UserData.fromJson(Map<String, dynamic> json) {
       id= json["id"];
      //id:  json["id"];
      name= json["name"];
      email= json["email"];
      phone= json["phone"];
      image= json["image"];
      points= json["points"];
      credit= json["credit"];
      token= json["token"];

  }
//

}