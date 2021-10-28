import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/course/view/my_course_details.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:redteam_xperience/shared_widget/expired_course.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  bool isExpired=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "My Courses",
        leftAlignTitle: true,
        color: Colors.white.withOpacity(.8),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child:
          Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context,index){
                    return SizedBox(height: 0,);
                  },
                  itemCount: 7,
                itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        if(isExpired==true){
                          Get.snackbar("Course Expired", "Please Renew it");
                        }
                        else{
                          Get.to(()=>MyCourseDetails());
                        }
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(padding: EdgeInsets.only(left: 2,right: 6,top: 2,bottom: 2),
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                ExpiredCourse(),
                                // Container(
                                //   height:131,
                                //   width:107,
                                //   decoration: BoxDecoration(borderRadius:
                                //   BorderRadius.circular(12),image: DecorationImage(image: AssetImage(ImageAssets.img2,), fit: BoxFit.fill,)),
                                // ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        "liveClassModel",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      Text(
                                        "liveCe.toString() AbsS hABsybasbahs JHBS",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption,
                                      ),
                                      SizedBox(height: 12,),

                                      isExpired==true
                                          ? Row(
                                            children: [
                                              Spacer(),
                                              ElevatedButton(
                                        onPressed: (){},
                                        child:Text("Renewal",style: Theme.of(context).textTheme.button!.copyWith(
                                              color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal,),),
                                        style: ButtonStyle(
                                              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.button),
                                              minimumSize: MaterialStateProperty.all(Size(92,32),),
                                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 6,horizontal: 16)),
                                              elevation: MaterialStateProperty.all(0),
                                              backgroundColor: MaterialStateProperty.all(CustomColors.red),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                        ),
                                      ),
                                              SizedBox(width: 12,)
                                            ],
                                          )

                                          :Row(
                                        children: [
                                          SvgPicture.asset(IconAssets.calendar,color: CustomColors.light2,height: 14,),
                                          SizedBox(width: 14,),
                                          Expanded(child: Text("8 days remaining",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),)),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      if(isExpired==false)Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          LinearPercentIndicator(
                                            padding: EdgeInsets.zero,
                                            width: MediaQuery.of(context).size.width-220,
                                            lineHeight: 6.0,
                                            percent: 0.5,
                                            backgroundColor: CustomColors.light1,
                                            progressColor: CustomColors.red,
                                          ),
                                          SizedBox(width: 10,),
                                          Text("80%",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                                          SizedBox(width: 10,)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                },
              ),
              SizedBox(height: 12,)
            ],
          ),

      ),
    );
  }
}
