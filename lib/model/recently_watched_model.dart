import 'package:redteam_xperience/core/constants/assets.dart';

class RecentlyWatchedModel {
  int id=123;
  String date="sss";
  String moduleName="Module";
  String bannerUrl=ImageAssets.img1;
  String teacherName="Teacher Name";
  String topicName="Topic";


  RecentlyWatchedModel({required this.moduleName, required this.bannerUrl, required this.id,required this.date,required this.teacherName,required this.topicName});

  RecentlyWatchedModel.test(){
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