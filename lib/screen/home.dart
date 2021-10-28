import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/course/view/all_courses.dart';
import 'package:redteam_xperience/features/events/model/event_model.dart';
import 'package:redteam_xperience/features/events/view/all_events_screen.dart';
import 'package:redteam_xperience/features/exam/view/all_exam_screen.dart';
import 'package:redteam_xperience/features/live_classes/view/live_class_screen.dart';
import 'package:redteam_xperience/features/live_classes/model/live_class_model.dart';
import 'package:redteam_xperience/model/user_model.dart';
import 'package:redteam_xperience/shared_widget/bottomSheet.dart';
import 'package:redteam_xperience/shared_widget/container1.dart';
import 'package:redteam_xperience/shared_widget/live_class_card_big.dart';
import 'package:redteam_xperience/shared_widget/recently_watched.dart';
import 'package:redteam_xperience/shared_widget/upcoming_live_class_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/assets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final eventModel=EventModel.eventList();
  final liveClassModel= LiveClassModel.test();
  final userModel=UserModel.test();
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
             Column(//TODO User Model or Shared Preference
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
                   userModel.name,
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
               child: CircleAvatar(
                   foregroundImage: AssetImage(userModel.imgUrl!),
                  ),
             )
           ],
         ),
       ),
       const SizedBox(
         height: 40,
       ),
       Padding(
         padding: const EdgeInsets.only(
           left: 16,
           right: 16,
         ),
         child: Row(
           children: [
             InkWell(
               onTap:()=>Get.to(()=>LiveClassScreen()),
               child: Container1(
                 icon: IconAssets.live,
                 title: "Live",
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 7.5),
               child: InkWell(onTap: ()=>Get.to(()=>AllExamScreen()),
                 child: Container1(
                   icon: IconAssets.live,
                   title: "Exams",
                 ),
               ),
             ),
           ],
         ),
       ),
       SizedBox(
         height: 16,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 16, right: 16),
         child: Row(
           children: [
             InkWell(
               onTap:()=>Get.to(()=>AllEventsScreen()),
               child: Container1(
                 icon: IconAssets.live,
                 title: "Events",
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 7.5),
               child: Container1(
                 icon: IconAssets.live,
                 title: "Forums",
               ),
             ),
           ],
         ),
       ),
       const SizedBox(
         height: 40,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 16, right: 16),
         child: Container(
           height: 158,
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               image: const DecorationImage(
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
                     Get.to(AllCourses());
                   },
                 ),
               ),
             ],
           ),
         ),
       ),
       const SizedBox(
         height: 54,
       ),
       Container(
         decoration: const BoxDecoration(
             color: Color(0xFFE5E5E5),
             borderRadius: BorderRadius.only(
               topRight: Radius.circular(32),
               topLeft: Radius.circular(32),
             )),
         child: Padding(
           padding:
               const EdgeInsets.only(top: 16, bottom: 52, left: 16, right: 16),
           child: Column(children: [
             Text(
               "Live Class",
               style: Theme.of(context).textTheme.subtitle1,
             ),
             const SizedBox(
               height: 20,
             ),
             LiveClassCardBig(
               liveClassModel: liveClassModel[1],
             ),
             SizedBox(height: 40,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: Text(
                     "Upcoming Live Classes",
                     style: Theme.of(context).textTheme.subtitle1,
                   ),
                 ),
                 InkWell(
                   onTap: (){//TODO Upcoming Live Class view all
                     Get.to(()=>LiveClassScreen());
                   },
                   child: Text(
                     "View all",
                     style: Theme.of(context)
                         .textTheme
                         .bodyText2
                         ?.copyWith(color: CustomColors.light2),
                   ),
                 ),
               ],

             ),
             SizedBox(height: 24,),
             Container(height: MediaQuery.of(context).size.height*.42,
               child: ListView.separated(
                 separatorBuilder: (BuildContext context, int index) {
                   return const SizedBox(
                     width: 16,
                   );
                 },
                 itemCount: liveClassModel.length,
                 shrinkWrap: true,
                 physics: const AlwaysScrollableScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (BuildContext context, int index) {
                   return InkWell(
                     onTap: (){
                       getBottomSheet(context, liveClassModel[index]);
                     },
                     child: UpcomingLiveClassCard(
                       liveClassModel: liveClassModel[index],
                     ),
                   );
                 },
               ),
             ),
           ]),
         ),
       ),
       Stack(
         children: [
           Transform.scale(
             scale: 1.5,
             child: Container(
               color: const Color(0xFFE5E5E5),
               child: SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: 40,
               ),
             ),
           ),
           Container(
             padding: const EdgeInsets.only(left: 16, right: 16),
             decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(32),
                   topLeft: Radius.circular(32),
                 )),
             child: Padding(
               padding: const EdgeInsets.only(top: 26, bottom: 24),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Text(
                     "Recently Watched",
                     style: Theme.of(context).textTheme.subtitle1,
                   ),
                   const SizedBox(
                     height: 24,
                   ),
                   ListView.separated(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     separatorBuilder: (BuildContext context, int index) {
                       return const SizedBox(
                         height: 32,
                       );
                     },
                     itemCount: 3,
                     itemBuilder: (BuildContext context, int index) {
                       return InkWell(
                           onTap: (){
                             print('Recently Watched');
                           },
                           child: const RecentlyWatched());
                     },
                   ),
                   const SizedBox(
                     height: 40,
                   ),
                   Text(
                     "Last Exam",
                     style: Theme.of(context)
                         .textTheme
                         .subtitle1
                         ?.copyWith(color: CustomColors.black),
                   ),
                   const SizedBox(
                     height: 23,
                   ),
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(16),
                         color: CustomColors.white1),
                     child: Row(
                       children: [
                         Column(
                           children: [
                             Padding(
                               padding:
                                   const EdgeInsets.only(left: 20, top: 31),
                               child: Text("Model Name",
                                   style:
                                       Theme.of(context).textTheme.subtitle1),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(
                                   left: 20, top: 16, bottom: 36),
                               child: Text("Model Name",
                                   style:
                                       Theme.of(context).textTheme.bodyText1),
                             ),
                           ],
                         ),
                         const Spacer(),
                         Transform.scale(
                           scale: 1.11,
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: CustomColors.red,
                             ),
                             child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(
                                     top: 14,
                                   ),
                                   child: Text(
                                     "120/500",
                                     style:
                                         Theme.of(context).textTheme.headline3,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(
                                       bottom: 8, top: 4),
                                   child: Text(
                                     "Your Score",
                                     style:
                                         Theme.of(context).textTheme.caption,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(
                                       left: 8, bottom: 8, right: 8),
                                   child: MaterialButton(
                                     onPressed: () {},
                                     color: CustomColors.black,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(8),
                                     ),
                                     child: Text(
                                       "Retry",
                                       style: Theme.of(context)
                                           .textTheme
                                           .headline4
                                           ?.copyWith(color: Colors.white),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 32,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "New discussion at forum",
                         style: Theme.of(context).textTheme.subtitle1,
                       ),
                       Text(
                         "View all",
                         style: Theme.of(context)
                             .textTheme
                             .bodyText2
                             ?.copyWith(color: CustomColors.light2),
                       )
                     ],

                   ),
                   const SizedBox(
                     height: 24,
                   ),
                   Container(
                     height: 133,
                     child: ListView.separated(
                       shrinkWrap: true,
                       physics: const AlwaysScrollableScrollPhysics(),
                       scrollDirection: Axis.horizontal,
                       separatorBuilder: (BuildContext context, int index) {
                         return const SizedBox(
                           width: 12,
                         );
                       },
                       itemCount: 4,
                       itemBuilder: (BuildContext context, int index) {
                         return Container(
                           width: 309,
                           decoration: BoxDecoration(
                             color: CustomColors.white1,
                             borderRadius: BorderRadius.circular(16),
                           ),
                           child: Row(
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                   color: CustomColors.red,
                                   borderRadius: BorderRadius.circular(16),
                                 ),
                                 width: 4,
                                 height: 101,
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child: Column(
                                   crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       "5hr Ago",
                                       style: Theme.of(context)
                                           .textTheme
                                           .caption
                                           ?.copyWith(
                                               color: CustomColors.light2),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(top: 8),
                                       child: Text(
                                         "Aspects of Augurs –Biowar\n ware and Biohacking ",
                                         style: Theme.of(context)
                                             .textTheme
                                             .subtitle2
                                             ?.copyWith(
                                                 color: CustomColors.black),
                                       ),
                                     ),
                                     const Spacer(),
                                     Text(
                                       "5hr Ago",
                                       style: Theme.of(context)
                                           .textTheme
                                           .caption
                                           ?.copyWith(
                                               color: CustomColors.light2),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         );
                       },
                     ),
                   ),
                   const SizedBox(
                     height: 32,
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "Upcoming Events",
                         style: Theme.of(context).textTheme.subtitle1,
                       ),
                       InkWell(
                         onTap: ()=>Get.to(()=>AllEventsScreen()),
                         child: Text(
                           "View all",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText2
                               ?.copyWith(color: CustomColors.light2),
                         ),
                       )
                     ],

                   ),

                   const SizedBox(
                     height: 21,
                   ),
                   Container(
                     height: 270,
                     child: GridView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         gridDelegate:
                             const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 13,
                           crossAxisCount: 1,
                               childAspectRatio: 1.43,
                         ),
                         itemCount: 2,
                         itemBuilder: (BuildContext context, int index) {
                           return InkWell(
                             onTap: (){
                               print(' ${MediaQuery.of(context).size.width}');
                             },
                             child: Container(
                               //margin: const EdgeInsets.only(right: 13),
                               decoration: BoxDecoration(color: CustomColors.red,
                                   borderRadius: BorderRadius.circular(16),
                                   image: DecorationImage(
                                       image: NetworkImage(eventModel[index].imgUrl),
                                       fit: BoxFit.fill)
                                   ),
                               // child: Image.asset(ImageAssets.img1,fit: BoxFit.fill,),
                             ),
                           );
                         }),
                   ),
                 ],
               ),
             ),
           ),
         ],
       ),
     ],
      );
  }
}
