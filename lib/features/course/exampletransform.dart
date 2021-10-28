// import 'package:flutter/material.dart';
// import 'package:redteam_xperience/core/style/custom_colors.dart';
// import 'package:redteam_xperience/features/course/model/course_model.dart';
// import 'package:redteam_xperience/shared_widget/appbar_scroll.dart';
//
// class ExampleCourseDetails extends StatefulWidget {
//   const ExampleCourseDetails({Key? key}) : super(key: key);
//
//   @override
//   _ExampleCourseDetailsState createState() => _ExampleCourseDetailsState();
// }
//
// class _ExampleCourseDetailsState extends State<ExampleCourseDetails> {
//   CourseModel allCourse=CourseModel.Test();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(shrinkWrap: true,slivers: <Widget>[
//         SliverAppBar(floating: true,
//           pinned: true,backgroundColor: Colors.black.withOpacity(.8),iconTheme: const IconThemeData(color: Colors.white,size: 32),
//           expandedHeight: 328,
//           flexibleSpace:
//           Container(
//             child:FlexibleSpaceBar(
//               background: Stack(
//                 //fit: StackFit.passthrough,
//                 children: [
//                   Container(
//                     foregroundDecoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: FractionalOffset.bottomCenter,
//                             end: FractionalOffset.topCenter,
//                             colors: [
//                               CustomColors.black,
//                               CustomColors.black.withOpacity(0),
//                             ],
//                             stops: [
//                               0.1,
//                               0.9
//                             ])),
//                     decoration: BoxDecoration(
//                       color: CustomColors.red,
//                       image: DecorationImage(image: AssetImage(allCourse.imgUrl),fit: BoxFit.fill),
//
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Spacer(),
//                         Text(allCourse.name,style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),),
//                         const SizedBox(height: 10,),
//                         Text(allCourse.branch,style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),),
//                         const SizedBox(height: 40,),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate(
//               [
//                 Transform.translate(
//                   offset: const Offset(0.0, -10.0),
//                   child: Container(
//
//                     padding: const EdgeInsets.all(8.0),
//                     color: const Color(0xFFE70000),
//                     child: const Text('Quarter'),
//                   ),
//                 )
//
//               ]),),
//
//       ]),
//     );
//   }
// }
