import 'package:redteam_xperience/core/constants/assets.dart';

class LiveClassModel {
  int? id;
  String? date;
  String? moduleName;
  String? bannerUrl;
  String? teacherName;
  String? topicName;
  String? time;
  String? caption;

  LiveClassModel(
      {this.moduleName,
      this.bannerUrl,
      this.id,
      this.date,
      this.teacherName,
      this.topicName,
      this.time,this.caption
      });

  static List<LiveClassModel> test() {
    return [
      LiveClassModel(
          moduleName: "Module 1",
          date: "May 22nd",
          id: 123,
          bannerUrl: ImageAssets.img1,
          teacherName: "Preshanth Booshan Ipsum test",topicName: "Aws Solution Architect ipsum bgb cv fdv v vfdgvfv cvsdftest example ipsum",
          time: "11.00 AM",
          caption: "The blended training methodology coupled with practical "
      "hands-on experience with highly equipped classroom infrastructure "
          "and the best of internationally certified trainers makes us unique."
          "The blended training methodology coupled with practical hands-on experience "
          "with highly equipped classroom infrastructure and the best of internationally "
          "certified trainers makes us unique.The blended training methodology coupled with "
          "practical hands-on experience with highly equipped classroom infrastructure and "
          "the best of internationally certified trainers makes us unique."
      ),
      LiveClassModel(
          moduleName: "Module 2",
          date: "Aug 22nd",
          id: 153,
          bannerUrl: ImageAssets.img2,
          teacherName: "Padmaja Booshan Ipsum test",topicName: "CCNA Solution Architect test example ipsum",
          time: "9.00 AM",
          caption: "Ipsum Test For Nort Sismamc kaasks aasl "
              "hands-on experience with highly equipped classroom infrastructure "
              "and the best of internationally certified trainers makes us unique."
              "The blended trainASunsjax jnasm hands-on experience "
              "with highly equipped classroom infrastructure and the best of internationally "
              "certified trainers makes us unique.The blended training methodology coupled with "
              "practical hands-on experience with highly equipped classroom infrastructure and "
              "the best of internationally certified trainers makes us unique."
      ),
      LiveClassModel(
          moduleName: "Module 3",
          date: "Sep 22nd",
          id: 196,
          bannerUrl: ImageAssets.getStarted,
          teacherName: "Virat Boosha YAjaoo k ss",topicName: "Architect ipsum skaoaslslssxsxnsinx",
          time: "10.30 AM",
          caption:
              "hands-on experience with highly equipped classroom infrastructure "
              "and the best of internationally certified trainers makes us unique."
              "The blended training methodology coupled with practical hands-on experience "
              "with highly equipped classroom infrastructure and the best of internationally "
              "certified trainers makes us unique.The blended training methodology coupled with "
              "practical hands-on experience with highly equipped classroom infrastructure and "
              "the best of internationally certified trainers makes us unique."
      ),
    ];
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
