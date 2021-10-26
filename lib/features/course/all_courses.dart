import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/course/course_details.dart';
import 'package:redteam_xperience/model/course_model.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';

class AllCourses extends StatefulWidget {
  AllCourses({Key? key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  final PageController pageController = PageController(initialPage: 0);
  CourseModel allCourses= CourseModel.Test();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Courses",
        color: Colors.white.withOpacity(.8),
      ),
      body:
      PageView.builder(
        itemCount: 3,
        controller: pageController, itemBuilder: (BuildContext context, int index) {
        return
      Column(
        children: [
          const SizedBox(
            height: 42,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(32),
                                topLeft: Radius.circular(32)),
                            child: Image.asset(allCourses.imgUrl)),
                        const SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(right: 20, top: 225, left: 270),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                          color: CustomColors.red,
                          borderRadius: BorderRadius.circular(16.5)),
                      child: Text(
                        "NEW",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        allCourses.name,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        allCourses.branch,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(IconAssets.calendar),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  allCourses.duration.inDays.toString() + " days",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          //SizedBox(width: 32,),
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(IconAssets.videoLive),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Live Class",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: CustomColors.white2,
                        height: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(IconAssets.note),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Exam",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),

                          //SizedBox(width: 32,),
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(IconAssets.videoSquare),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Video Class",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: CustomColors.white2,
                        height: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(IconAssets.book),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Materials",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),

                          //SizedBox(width: 32,),
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(IconAssets.certificate),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Certification",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 99,
              color: Colors.white.withOpacity(.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  allCourses.ifOffer?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 19,
                      ),
                      Text(
                        "₹ "+allCourses.offerPrice,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: CustomColors.red),
                      ),
                      Text(
                        "₹ "+allCourses.mrpRate,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: CustomColors.light2,decorationColor: CustomColors.red,
                            decorationThickness: 1,
                            decoration: TextDecoration.lineThrough,),
                      ),
                    ],
                  ):Text(
                    "₹ "+allCourses.mrpRate,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: CustomColors.red),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Get.to(()=>CourseDetails());
                    },

                    child: Row(
                      children: [
                        Text("View",style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal,),),
                        SizedBox(width: 15,),
                        SvgPicture.asset(IconAssets.arrowright)
                      ],
                    ),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.button),
                      padding: MaterialStateProperty.all(const EdgeInsets.only(top: 16,bottom: 16,left: 35,right: 20)),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(CustomColors.red,),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      );},),
    );
  }
}
