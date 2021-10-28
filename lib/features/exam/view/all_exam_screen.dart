import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/exam/model/exam_model.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';

class AllExamScreen extends StatefulWidget {
  const AllExamScreen({Key? key}) : super(key: key);

  @override
  State<AllExamScreen> createState() => _AllExamScreenState();
}

class _AllExamScreenState extends State<AllExamScreen> {
  final examModel=ExamModel.test();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: "Exams",
        color: Colors.white.withOpacity(.8),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ListView.separated(separatorBuilder: (context, index){
              return const SizedBox(height: 12,);
            },
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index){
              return Container(padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        SvgPicture.asset(IconAssets.calendar,color: CustomColors.red,height: 12,),
                        const SizedBox(width: 10,),
                        Text(examModel.date + " | " + examModel.time,style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.red),),
                      ],
                    ),
                    Text(examModel.topicName,style: Theme.of(context).textTheme.subtitle1,),
                    SizedBox(height: 12,),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(color: CustomColors.white2,borderRadius: BorderRadius.circular(12)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Row(
                                children: [
                                  SvgPicture.asset(IconAssets.question,color: CustomColors.light2,height: 12,),
                                  const SizedBox(width: 10,),
                                  Text(examModel.questionNumbers.toString() +" Questions",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                                ],
                              ),
                              const SizedBox(width: 30,),
                              Row(
                                children: [
                                  SvgPicture.asset(IconAssets.tickCircleGrey,color: CustomColors.light2,height: 12,),
                                  const SizedBox(width: 10,),
                                  Text(examModel.totalMark +" Marks",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4,),
                          Row(
                            children: [
                              const SizedBox(width: 10,),
                              SvgPicture.asset(IconAssets.timer,color: CustomColors.light2,height: 12,),
                              const SizedBox(width: 10,),
                              Text(examModel.timer +" Minutes",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
