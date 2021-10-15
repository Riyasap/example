import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/model/live_class_model.dart';



class LiveClassCard extends StatelessWidget {
  LiveClassCard({required this.moduleName, required this.bannerUrl, required this.id,required this.date,required this.teacherName,required this.topicName});

  int id=123;
  String date="sss";
  String moduleName="Module";
  String bannerUrl=ImageAssets.img1;
  String teacherName="Teacher Name";
  String topicName="Topic";




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(bannerUrl,fit: BoxFit.fitWidth,),
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 12,bottom: 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(moduleName,style: Theme.of(context).textTheme.caption,),
                Text(topicName,style: Theme.of(context).textTheme.caption,),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(date,style: Theme.of(context).textTheme.caption,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(teacherName,style: Theme.of(context).textTheme.caption,),
                ),
              ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
