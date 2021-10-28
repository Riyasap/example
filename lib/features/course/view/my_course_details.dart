import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/course/model/course_model.dart';
import 'package:redteam_xperience/shared_widget/appbar_scroll.dart';
import 'package:pie_chart/pie_chart.dart';

class MyCourseDetails extends StatefulWidget {
  const MyCourseDetails({Key? key}) : super(key: key);

  @override
  _MyCourseDetailsState createState() => _MyCourseDetailsState();
}

class _MyCourseDetailsState extends State<MyCourseDetails> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  List<CourseModel> courseModel = CourseModel.test();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        // SliverAppBar(
        //   pinned: true,
        //   backgroundColor: Colors.black.withOpacity(.8),
        //   iconTheme: const IconThemeData(color: Colors.white, size: 32),
        //   expandedHeight: 390,
        //   flexibleSpace: Container(
        //     child: FlexibleSpaceBar(
        //       //collapseMode: CollapseMode.none,
        //       background: Stack(
        //         //fit: StackFit.passthrough,
        //         children: [
        //           Container(
        //             foregroundDecoration: BoxDecoration(
        //                 gradient: LinearGradient(
        //                     begin: FractionalOffset.bottomCenter,
        //                     end: FractionalOffset.topCenter,
        //                     colors: [
        //                   CustomColors.black,
        //                   CustomColors.black.withOpacity(0),
        //                 ],
        //                     stops: const [
        //                   0.1,
        //                   0.9
        //                 ])),
        //             decoration: BoxDecoration(
        //               color: CustomColors.red,
        //               image: DecorationImage(
        //                   image: AssetImage(courseModel[0].imgUrl),
        //                   fit: BoxFit.fill),
        //             ),
        //           ),
        //           Container(
        //             margin: const EdgeInsets.only(left: 16, right: 16),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 const Spacer(),
        //                 Text(
        //                   courseModel[0].name,
        //                   style: Theme.of(context)
        //                       .textTheme
        //                       .headline1
        //                       ?.copyWith(color: Colors.white),
        //                 ),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text(
        //                   courseModel[0].branch,
        //                   style: Theme.of(context)
        //                       .textTheme
        //                       .headline3
        //                       ?.copyWith(color: Colors.white),
        //                 ),
        //                 const SizedBox(
        //                   height: 24,
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     LinearPercentIndicator(
        //                       padding: EdgeInsets.zero,
        //                       width: MediaQuery.of(context).size.width - 85,
        //                       lineHeight: 6.0,
        //                       percent: 0.5,
        //                       backgroundColor: CustomColors.light1,
        //                       progressColor: CustomColors.red,
        //                     ),
        //                     Spacer(),
        //                     Text(
        //                       "80%",
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .bodyText2
        //                           ?.copyWith(color: CustomColors.light2),
        //                     ),
        //                     //SizedBox(width: 10,)
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 24,
        //                 ),
        //                 Stack(
        //                   children: [
        //                     Transform.translate(
        //                       offset: Offset(0, 30),
        //                       child: Container(
        //                         color: CustomColors.green,
        //                         width: 100,
        //                         height: 60,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: MediaQuery.of(context).size.height * .45,
            child: Stack(children: [
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
                      image: AssetImage(courseModel[0].imgUrl),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          courseModel[0].name,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          courseModel[0].branch,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.white),
                        ),
                        Transform.translate(
                          offset: Offset(0, 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LinearPercentIndicator(
                                padding: EdgeInsets.zero,
                                width: MediaQuery.of(context).size.width - 85,
                                lineHeight: 6.0,
                                percent: 0.5,
                                backgroundColor: CustomColors.light1,
                                progressColor: CustomColors.red,
                              ),
                              Spacer(),
                              Text(
                                "80%",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: CustomColors.light2),
                              ),
                              //SizedBox(width: 10,)
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Transform.translate(
                                offset: Offset(0, 47),
                                child: InkWell(
                                  onTap: () {
                                    print('print~~~~');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: CustomColors.red),
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 20,
                                              bottom: 20),
                                          child: SvgPicture.asset(
                                            IconAssets.material,
                                            width: 40,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Material",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Transform.translate(
                                offset: Offset(0, 47),
                                child: InkWell(
                                  onTap: () {
                                    print('print~~~~');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: CustomColors.red),
                                          padding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 20,
                                              bottom: 20),
                                          child: SvgPicture.asset(
                                            IconAssets.note_big,
                                            width: 40,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "PYQ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))
            ]),
          ),
          SizedBox(
            height: 65,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Modules",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12,
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                  Column(
                    children: [
                      SvgPicture.asset(IconAssets.lockCircle1,color: CustomColors.light1,width: 63,),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: CustomColors.red.withOpacity(.4),
                            borderRadius: BorderRadius.circular(120)),
                        child: PieChart(
                          dataMap: {
                            "completed": 8,
                            "Not Comleted": 5,
                          },
                          chartLegendSpacing: 20,
                          colorList: [
                            CustomColors.red,
                            CustomColors.red.withOpacity(.2)
                          ],
                          chartRadius: 40,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValues: false,
                          ),
                          legendOptions: LegendOptions(showLegends: false),
                          initialAngleInDegree: 268,
                        ),
                      ),

                      CircleAvatar(backgroundColor: CustomColors.green,radius: 28,child: SvgPicture.asset(IconAssets.tickCircleGrey,width: 48 ,color: Colors.white,),),
                    ],
                  ),
                      // Container(
                      //   padding: EdgeInsets.all(4),
                      //   decoration: BoxDecoration(
                      //       color: CustomColors.red.withOpacity(.4),
                      //       borderRadius: BorderRadius.circular(120)),
                      //   child: PieChart(
                      //     dataMap: {
                      //       "completed": 8,
                      //       "Not Comleted": 5,
                      //     },
                      //     chartLegendSpacing: 20,
                      //     colorList: [
                      //       CustomColors.red,
                      //       CustomColors.red.withOpacity(.2)
                      //     ],
                      //     chartRadius: 35,
                      //     chartValuesOptions: ChartValuesOptions(
                      //       showChartValues: false,
                      //     ),
                      //     legendOptions: LegendOptions(showLegends: false),
                      //     initialAngleInDegree: 268,
                      //   ),
                      // ),

                      //CircleAvatar(backgroundColor: CustomColors.green,radius: 30,child: SvgPicture.asset(IconAssets.tickCircleGrey,width: 52,color: Colors.white,),),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Module 1",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: CustomColors.light2),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Cyber security building block",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })
        ]))
      ],
    ));
  }
}
