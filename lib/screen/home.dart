import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/model/live_class_model.dart';
import 'package:redteam_xperience/screen/register/register_screen.dart';
import 'package:redteam_xperience/screen/get_started/get_started.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/container1.dart';
import 'package:redteam_xperience/shared_widget/customRow.dart';
import 'package:redteam_xperience/shared_widget/live_class_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/assets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // LiveClassModel liveClassModel=LiveClassModel(date:"sss",id: 128,
  //     moduleName:"Module",
  //     bannerUrl:ImageAssets.img1,
  //     teacherName:"Teacher Name",
  //     topicName:"Topic",);
  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: GoogleFonts.poppins(
                        fontSize: 34,
                        color: CustomColors.black,
                        height: 1.4,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Patrice Evra",
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
              const Spacer(),
              Container(
                width: 63,
                height: 63,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(29)),
                child: Image.asset(ImageAssets.user),
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              Container1(
                icon: IconAssets.live,
                title: "Live",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Container1(
                  icon: IconAssets.live,
                  title: "Live",
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 158,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage(
                      ImageAssets.banner1,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Text(
                    "Find other courses\nYou want to learn",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "+ Explore",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white),
                    ),
                    color: CustomColors.black,
                    onPressed: () {
                      //TODO Explore Page
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 54,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              )),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 16, bottom: 129, left: 16, right: 16),
            child: Column(
              children: [
                Text(
                  "Live Class",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 293,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: CustomColors.black,),
                  child: Stack(
                   //crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Container(
                       height: 230,
                       foregroundDecoration: BoxDecoration( gradient: LinearGradient(
                           begin: FractionalOffset.bottomCenter,
                           end: FractionalOffset.topCenter,
                           colors: [
                             CustomColors.black,
                             CustomColors.black.withOpacity(0),
                           ],stops: [
                         0.1,
                         0.9
                       ]
                       )),
                       decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage(ImageAssets.liveClass,),fit: BoxFit.fitWidth)),
                     ),
                     Positioned(
                       right: 16,
                       top: 16,
                       child: Container(
                         height: 25,
                         decoration: BoxDecoration(
                           color: CustomColors.red,
                           borderRadius: BorderRadius.circular(8),
                         ),
                         child: Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(
                                   left: 5, top: 7, bottom: 7, right: 1),
                               child: CircleAvatar(
                                 radius: 11,
                                 backgroundColor: Colors.white,
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(right: 8),
                               child: Text(
                                 "Live",
                                 style: Theme.of(context)
                                     .textTheme
                                     .button
                                     ?.copyWith(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 70),
                       child: Align(
                           alignment: Alignment.topCenter,
                           child: Image.asset(IconAssets.play)),
                     ),
                     Column(mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 16,top:  154),
                           child: Text(
                             "Module name here",
                             style: Theme.of(context)
                                 .textTheme
                                 .caption
                                 ?.copyWith(color: Colors.white),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:16,top: 6),
                           child: Text(
                             "Elements of Information Security(CIA-\nTriad),Non-repudiation, Authenticity",
                             style: Theme.of(context)
                                 .textTheme
                                 .subtitle2
                                 ?.copyWith(color: Colors.white),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 16,top: 18),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CircleAvatar(
                                 backgroundColor: CustomColors.white1,
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 19,),
                                 child: MaterialButton(color: CustomColors.red,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(8),),

                                   onPressed: () {},
                                   child: Center(
                                       child: Text(
                                         "+ Join",
                                         style: Theme.of(context)
                                             .textTheme
                                             .headline4
                                             ?.copyWith(color: Colors.white),
                                       )),
                                 ),
                               )
                             ],
                           ),
                         ),
                       ],
                     ),

                   ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 24),
                  child: CustomRow(
                      child1: Text(
                        "Upcoming Live Classes",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      child2: Text(
                        "View all",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: CustomColors.light2),
                      )),
                ),
                Container(height: 300,
                  child: ListView(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  child: Image.asset(ImageAssets.img1,fit: BoxFit.fitWidth,),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16,top: 12,bottom: 16),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Module",style: Theme.of(context).textTheme.caption,),
                                    Text("topicName",style: Theme.of(context).textTheme.subtitle2,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text("date",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text("teacherName",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image.asset(ImageAssets.img1,fit: BoxFit.fitWidth,),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16,top: 12,bottom: 16),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Module",style: Theme.of(context).textTheme.caption,),
                                    Text("topicName",style: Theme.of(context).textTheme.subtitle2,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text("date",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text("teacherName",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
