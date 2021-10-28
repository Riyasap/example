import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/live_classes/model/live_class_model.dart';



class UpcomingLiveClassCard extends StatelessWidget {
  UpcomingLiveClassCard({required this.liveClassModel,});
  LiveClassModel liveClassModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      //height: 286,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 170,
            child: ClipRRect(
              child: Image.
              asset(
                liveClassModel.bannerUrl!,
                fit: BoxFit.fill,
              ),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 12, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    liveClassModel.moduleName!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    liveClassModel.topicName!,
                    style:
                    Theme.of(context).textTheme.subtitle2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                     liveClassModel.date!,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(
                          color: CustomColors.light2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      liveClassModel.teacherName!,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(
                          color: CustomColors.light2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
