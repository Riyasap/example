import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RecentlyWatched extends StatelessWidget {
  const RecentlyWatched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: CustomColors.white1,),
      child: Row(
        children: [
          Container(
            width: 113,
            height: 98,
            child: Padding(
              padding: const EdgeInsets.only(top: 9,left: 22,right: 22),
              child: Image.asset(IconAssets.play),
            ),
            decoration: BoxDecoration(image: const DecorationImage(image: AssetImage(ImageAssets.liveClass),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(14)
            ),
          ),
          const SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Topic Name",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
              Text("Module Name",style: Theme.of(context).textTheme.subtitle2?.copyWith(color: CustomColors.black),),
              const SizedBox(height: 11,),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text("75% Completed",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
              ),
              LinearPercentIndicator(
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width-181,
                lineHeight: 6.0,
                percent: 0.5,
                backgroundColor: CustomColors.light1,
                progressColor: CustomColors.red,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
