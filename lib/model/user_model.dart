import 'package:redteam_xperience/core/constants/assets.dart';

class UserModel {
  UserModel({
    required this.phoneNo,required this.userId,this.imgUrl,required this.name
  });

  String phoneNo;
  int userId;
  String? imgUrl;
  String name;
  factory UserModel.test(){
    return UserModel(phoneNo: "8899889977", userId: 87952,imgUrl: ImageAssets.liveClass,name: "Patric Viera");

  }



}