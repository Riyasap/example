import 'package:redteam_xperience/core/constants/assets.dart';

class LiveClassModel {
  int? id;
  String? date;
  String? moduleName;
  String? bannerUrl;
  String? teacherName;
  String? topicName;

  LiveClassModel({this.moduleName,  this.bannerUrl,  this.id, this.date, this.teacherName, this.topicName});

   LiveClassModel.test(){
    id=123;
    date="sss";
    moduleName="Module";
    bannerUrl=ImageAssets.img1;
    teacherName="Teacher Name";
    topicName="Elements of Information Security(CIA-Triad),";
  }

  // LiveClassModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   bannerUrl = json['banner_url'];
  //   colorCode=json['color_code'];
  //
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['banner_url'] = this.bannerUrl;
  //   return data;
  // }
}