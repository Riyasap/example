import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/events/model/event_model.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';

class AllEventsScreen extends StatelessWidget {
  AllEventsScreen({Key? key}) : super(key: key);
  final eventModel=EventModel.eventList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Events",
        color: Colors.white.withOpacity(.8),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            GridView.builder(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 13,
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: eventModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print(eventModel[index].eventUrl);
                    },
                    child: Container(
                      //margin: const EdgeInsets.only(right: 13),
                      decoration: BoxDecoration(
                          color: CustomColors.red,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(eventModel[index].imgUrl),
                              fit: BoxFit.fill)),
                      // child: Image.asset(ImageAssets.img1,fit: BoxFit.fill,),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
