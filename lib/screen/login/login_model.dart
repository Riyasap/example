import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.phoneNo,this.userId
  });

  String phoneNo;
  String? userId;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    phoneNo: json["phone_no"],
  );

  Map<String, dynamic> toJson() => {
    "phone_no": phoneNo,
    "user_id":userId
  };
}
