class UserModel {
  UserModel({
    required this.phoneNo,required this.userId
  });

  String phoneNo;
  String userId;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        phoneNo: json["phone_no"], userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "phone_no": phoneNo,
    "user_id":userId
  };

}