import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/course/model/course_model.dart';
import 'package:redteam_xperience/model/video_model.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({required this.courseModel});
CourseModel courseModel;
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  VideoModel video = VideoModel.test();
  bool descTextShowFlag = false;
  List<String> descriptionItems = List<String>.generate(55, (i) => "Item $i");
  List<String> syllabusItems = List<String>.generate(20, (i) => "Item $i");
  List<String> items1 = <String>[];
  List<SyllabusModel> items2 = <SyllabusModel>[];
  int perPageDescrptn = 4;
  int presentDescptn = 0;
  int perPageSyllabus = 4;
  int presentSyllabus = 0;
  bool isSyllabusPressed = false;
  bool isSeeMorePressed = false;
  List<SyllabusModel> syllabusM=SyllabusModel.test();

  late ChewieController chewieController;
  @override
  void initState() {

    super.initState();
    if(widget.courseModel.courseDesc.length<=perPageDescrptn){
      isSeeMorePressed=true;
    }
    if(widget.courseModel.syllabusModel.length<=perPageSyllabus){
      isSyllabusPressed=true;
    }
    VideoPlayerController videoPlayerController =
        VideoPlayerController.network(widget.courseModel.videoPreviewUrl);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      //autoPlay: true,
      autoInitialize: true,
    );

    // setState(() {
    //   items1.addAll(descriptionItems.getRange(
    //       presentDescptn, presentDescptn + perPageDescrptn));
    //   items2.addAll(syllabusItems.getRange(
    //       presentSyllabus, presentSyllabus + perPageSyllabus));
    //   presentDescptn = presentDescptn + perPageDescrptn;
    //   presentSyllabus = presentSyllabus + perPageSyllabus;
    // });
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
                        image: AssetImage(widget.courseModel.imgUrl), fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        widget.courseModel.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.courseModel.branch,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Chewie(
                            controller: chewieController,
                          ),
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
                                        widget.courseModel.duration +
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

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: (isSeeMorePressed==false)
                            ?(presentDescptn+perPageDescrptn<=widget.courseModel.courseDesc.length)
                              ?perPageDescrptn
                              :widget.courseModel.courseDesc.length
                            :widget.courseModel.courseDesc.length,
                        itemBuilder: (context, index) {
                          return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconAssets.tickCircleRed,
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        Expanded(
                                            child: Text(
                                          widget.courseModel.courseDesc[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    )
                                  ],
                                );
                        },
                      ),
                      const SizedBox(height: 10,),
                      if(isSeeMorePressed==false)
                      MaterialButton(
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
                            items1.addAll(widget.courseModel.courseDesc.getRange(
                                presentSyllabus, widget.courseModel.courseDesc.length));
                            presentDescptn==widget.courseModel.courseDesc.length;
                            isSeeMorePressed=true;
                          });
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
                        gradient: isSyllabusPressed
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
                      child: ListView.separated(
                        separatorBuilder: (context,index){
                         return SizedBox(height: 14,);
                        },
                          padding: EdgeInsets.zero,
                          itemCount:(isSyllabusPressed==false)
                                ?(presentSyllabus+perPageSyllabus<=widget.courseModel.syllabusModel.length)
                                    ?perPageSyllabus
                                    :widget.courseModel.syllabusModel.length
                                :widget.courseModel.syllabusModel.length,

    //(presentDescptn <= syllabusItems.length)
                              // ? items2.length + 1
                              // : items2.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
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
                                          widget.courseModel.syllabusModel[index].imgUrl,fit: BoxFit.fill,
                                          width: MediaQuery.of(context).size.width*.2978,
                                          height: MediaQuery.of(context).size.width*.20572,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.courseModel.syllabusModel[index].topicName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          widget.courseModel.syllabusModel[index].subtitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(
                                                  color: CustomColors.light2),
                                        ),
                                        SizedBox(height: 15,),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              widget.courseModel.syllabusModel[index].duration +" min",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                      color: CustomColors
                                                          .light2),
                                            ),
                                            Spacer(),
                                            SvgPicture.asset(IconAssets.right),

                                            SizedBox(width: 15,),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    if (isSyllabusPressed == false)
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
                                  items2.addAll(widget.courseModel.syllabusModel.getRange(
                                  presentSyllabus, widget.courseModel.syllabusModel.length));
                                  presentSyllabus==widget.courseModel.courseDesc.length;
                                  isSyllabusPressed=true;
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
                            itemCount: widget.courseModel.paymentModel.length,
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
                              // switch(index){//TODO SWITCh
                              // case 0: "First"
                              // break;
                              // case 1: "Second"
                              // break;
                              // case 2: "Third"
                              // break;
                              // case 3: "Fourth"
                              // break;
                              //
                              // }
                                  Text(" Installment",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: CustomColors.black),),
                                  SizedBox(height: 6,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.calendar,color: CustomColors.light2,),
                                      SizedBox(width: 10,),
                                      Text(widget.courseModel.paymentModel[index].duration +" days",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                                    ],
                                  ),
                                  SizedBox(height: 12,),

                                ],
                              ),
                              Spacer(),
                              Text("₹"+ widget.courseModel.paymentModel[index].rate.toString(),style: Theme.of(context).textTheme.headline3?.copyWith(color: CustomColors.red),),
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
                  color: CustomColors.bglte,
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
