import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/model/course_model.dart';
import 'package:redteam_xperience/model/video_model.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CourseDetails extends StatefulWidget {
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  CourseModel allCourse = CourseModel.Test();
  VideoModel video = VideoModel.test();
  bool descTextShowFlag = false;
  List<String> descriptionItems = List<String>.generate(55, (i) => "Item $i");
  List<String> syllabusItems = List<String>.generate(20, (i) => "Item $i");
  List<String> items1 = <String>[];
  List<String> items2 = <String>[];
  int perPageDescrptn = 10;
  int presentDescptn = 0;
  int perPageSyllabus = 5;
  int presentSyllabus = 0;
  bool isPressed = false;

  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    VideoPlayerController videoPlayerController =
        VideoPlayerController.network(video.videoUrl.toString());
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      //autoPlay: true,
      autoInitialize: true,
    );

    setState(() {
      items1.addAll(descriptionItems.getRange(
          presentDescptn, presentDescptn + perPageDescrptn));
      items2.addAll(syllabusItems.getRange(
          presentSyllabus, presentSyllabus + perPageSyllabus));
      presentDescptn = presentDescptn + perPageDescrptn;
      presentSyllabus = presentSyllabus + perPageSyllabus;
    });
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(shrinkWrap: true, slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.black.withOpacity(.8),
        iconTheme: const IconThemeData(color: Colors.white, size: 32),
        expandedHeight: 328,
        flexibleSpace: Container(
          child: FlexibleSpaceBar(
            //collapseMode: CollapseMode.none,
            background: Stack(
              //fit: StackFit.passthrough,
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                        CustomColors.black,
                        CustomColors.black.withOpacity(0),
                      ],
                          stops: const [
                        0.1,
                        0.9
                      ])),
                  decoration: BoxDecoration(
                    color: CustomColors.red,
                    image: DecorationImage(
                        image: AssetImage(allCourse.imgUrl), fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        allCourse.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        allCourse.branch,
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Stack(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: CustomColors.black,
                child: SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 218,
                        //width: 349,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Chewie(
                          controller: chewieController,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "This Course Includes",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 21),
                        decoration: BoxDecoration(
                            color: CustomColors.white1,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              width: 4,
                              height: 92,
                            ),
                            SizedBox(
                              width: 30.5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.calendar),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        allCourse.duration.inDays.toString() +
                                            " days",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.videoLive),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Live Class",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.note),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Exam",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.videoSquare),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Video Content",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.book),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Materials",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.certificate),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Certification",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //SizedBox(width: 23.5,),
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              width: 4,
                              height: 92,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        "What you’ll learn",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: (presentDescptn <= descriptionItems.length)
                            ? items1.length + 1
                            : items1.length,
                        itemBuilder: (context, index) {
                          return (index == items1.length)
                              ? MaterialButton(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 17,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "See more",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                ?.copyWith(
                                                    color: CustomColors.red),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 7, bottom: 4),
                                            child: SvgPicture.asset(
                                              IconAssets.arrowdown,
                                              height: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if ((presentDescptn + perPageDescrptn) >
                                          descriptionItems.length) {
                                        items1.addAll(descriptionItems.getRange(
                                            presentDescptn,
                                            descriptionItems.length));
                                      } else {
                                        items1.addAll(descriptionItems.getRange(
                                            presentDescptn,
                                            presentDescptn + perPageDescrptn));
                                      }
                                      presentDescptn =
                                          presentDescptn + perPageDescrptn;
                                    });
                                  },
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconAssets.tickCircle,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Expanded(
                                            child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing blah blah ${index + 1}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 14,
                                    )
                                  ],
                                );
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  )),
            ),
          ],
        ),
        Stack(children: [
          Transform.scale(
            scale: 1.2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: CustomColors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          "Syllabus",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white),
                        ))),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          "5 Modules | 115 Lectures",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: CustomColors.light2),
                        ))),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: isPressed
                            ? null
                            : LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.topCenter,
                                colors: [
                                    CustomColors.black,
                                    CustomColors.black.withOpacity(0),
                                  ],
                                stops: const [
                                    0.1,
                                    0.9
                                  ]),
                      ),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: (presentDescptn <= syllabusItems.length)
                              ? items2.length + 1
                              : items2.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: CustomColors.bglte,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: Image.asset(
                                              ImageAssets.liveClass,
                                              scale: 4.5,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Introduction",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(color: Colors.white),
                                          ),
                                          Text(
                                            "Course introduction & over view",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(
                                                    color: CustomColors.light2),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "25 min",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                        color: CustomColors
                                                            .light2),
                                              ),
                                              SvgPicture.asset(IconAssets.right)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 14),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    if (isPressed != true)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: CustomButton(
                              title: "View Syllabus",
                              radius: 124,
                              color: Colors.white,
                              textColor: CustomColors.black,
                              onPressed: () {
                                setState(() {
                                  items2.addAll(syllabusItems.getRange(
                                      presentSyllabus, syllabusItems.length));
                                  isPressed = true;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 45,)
                        ],
                      ),
                    SizedBox(height: 10,)
                  ]),
            ),
          )
        ]),

          Stack(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: CustomColors.black,
                  child: SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        Text("Payments",style: Theme.of(context).textTheme.subtitle1,),
                        //SizedBox(height: 16,),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (BuildContext context,int index){
                          return Container(
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(color: CustomColors.white1,borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              SizedBox(width: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 12,),
                                  Text("First Installment",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: CustomColors.black),),
                                  SizedBox(height: 6,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.calendar,color: CustomColors.light2,),
                                      SizedBox(width: 10,),
                                      Text("20 days",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                                    ],
                                  ),
                                  SizedBox(height: 12,),

                                ],
                              ),
                              Spacer(),
                              Text("₹3000",style: Theme.of(context).textTheme.headline3?.copyWith(color: CustomColors.red),),
                              SizedBox(width: 24,)
                            ],
                          ),
                          );
                        }),
                        SizedBox(height: 24,),
                        Row(
                          children: [
                            SvgPicture.asset(IconAssets.infoCircle,color: CustomColors.light2,),
                            SizedBox(width: 15,),
                            Expanded(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),)),
                          ],
                        ),
                        SizedBox(height: 21,),
                      ]),
                ),
              ),
            ],
          ),
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 17,right: 31,left: 31),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white,boxShadow:  [
                BoxShadow(
                  color: CustomColors.red,
                  blurRadius: 0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, -0.3), // shadow direction: bottom right
                )
              ],),
              child: CustomButton(child: true,rate: "3000",title: "Pay now",onPressed: (){//TODO:pay function
              },),
            ),

      ]))
    ]));
  }
}
