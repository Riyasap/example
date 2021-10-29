import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Container(margin:const EdgeInsets.symmetric(horizontal: 16),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Topic Name hA HAbb AA AA XX SS QQ",style: Theme.of(context).textTheme.bodyText2,),

                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("25 min",style: Theme.of(context).textTheme.caption?.copyWith(color: CustomColors.light2),),
                    Row(children: [
                      SvgPicture.asset(IconAssets.tickCircleGrey,color: CustomColors.green,width: 25,height: 25,),
                      SizedBox(width: 24,),
                      SvgPicture.asset(IconAssets.bookmark,color: CustomColors.white2,width: 25,height: 25,),
                      SizedBox(width: 5,)
                    ],),

                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
