import 'package:redteam_xperience/core/constants/assets.dart';

class CourseModel {
  CourseModel({required this.id,required this.ifOffer,required this.name,required this.branch,required this.duration,required this.imgUrl,required this.mrpRate,required this.offerPrice});
  late final String id;
  late final String name;
  late final String imgUrl;
  late final String branch;
  late final Duration duration;
  late final String mrpRate;
  late final String offerPrice;
  late final bool ifOffer;

  CourseModel.Test(){
    id="57862";
    name="AWS";
    branch="Solution Advanced Diploma in Cyber Defense";
    imgUrl=ImageAssets.myCourse;
    duration=Duration(days: 210);
    mrpRate="7000";
    offerPrice="4000";
    ifOffer=true;

  }

}