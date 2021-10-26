import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: CustomColors.white1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                titleSpacing: 0,
                elevation: 0,
                primary: true,
                leading: Container(
                    padding: EdgeInsets.all(12),
                    child:
                    CircleAvatar(backgroundColor: CustomColors.red)),
                backgroundColor: Theme.of(context).canvasColor,
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 40,
                                width: 100,
                                color: CustomColors.green)
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 100,
                            color: CustomColors.red)
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.all(24),
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 65,
                    height: 65,
                    color: CustomColors.green,
                    margin: EdgeInsets.all(16),
                  );
                },
              ),
              Column(
                children: [
                  // getTitleItem("assets/images/Crash Course.png",
                  //     "Crash Course", "View all", () {}, false),
                  Container(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 16),
                        itemCount: 3,
                        itemBuilder: (con, index) => Container(
                          width: 270,
                          height: 60,
                          color: CustomColors.light2,
                        )),
                  ),
                ],
              ),
              // getTitleItem("assets/images/Live Classes.png", "Live Classes",
              //     "View all", () {
              //       Get.to(LiveClassesScreen(true),
              //           transition: Transition.rightToLeft);
              //     }),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 60,
                        color: CustomColors.light2,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
