import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/live_classes/model/live_class_model.dart';


getBottomSheet(BuildContext context,LiveClassModel liveClassModel){
  showModalBottomSheet<dynamic>(context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: const Radius.circular(16))),
      builder: (BuildContext context){
        return Wrap(
          children:[ Container(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12,),
                Center(
                  child: Container(
                    color: CustomColors.white2,
                    child: const SizedBox(height: 4,width: 60,),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: ()=>Navigator.pop(context),
                        child: SvgPicture.asset(IconAssets.close,height: 20,)),
                    SizedBox(width: 8,),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Text(liveClassModel.topicName!,style: Theme.of(context).textTheme.headline3,)),
                  ],
                ),
                SizedBox(height: 19,),
                Row(
                  children: [
                    SvgPicture.asset(IconAssets.user,color: CustomColors.light2,height: 14,),
                    SizedBox(width: 10,),
                    Text(liveClassModel.teacherName!,style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SizedBox(width: 2,),
                    SvgPicture.asset(IconAssets.clock,color: CustomColors.light2,height: 12,),
                    SizedBox(width: 10,),
                    Text(liveClassModel.date! +" | "+ liveClassModel.time!,style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),

                  ],
                ),
                SizedBox(height: 24,),
                Text(liveClassModel.caption!,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.bglte),),
                SizedBox(height: 24,),
              ],
            ),
          ),]
        );
      });
}