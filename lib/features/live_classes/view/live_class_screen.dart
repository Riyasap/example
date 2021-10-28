
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/live_classes/model/live_class_model.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({Key? key}) : super(key: key);

  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  List<LiveClassModel> liveClassModel=LiveClassModel.test();
  bool test=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:  AppBarCustom(
        title: "Live Classes",
        color: Colors.white.withOpacity(.8),
      ),
      body: test?
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 125,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Stack(
                  children: [
                    Container(padding: EdgeInsets.symmetric(horizontal: 60,vertical: 47),
                      height: 140,
                      width: 174,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),boxShadow:  [
                        BoxShadow(
                          color: CustomColors.white1.withOpacity(.4),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0,0.0), // shadow direction: bottom right
                        )],
                      color: CustomColors.light1.withOpacity(0.4),),
                      child: SvgPicture.asset(IconAssets.live),
                    ),
                    Transform.translate(
                      offset: Offset(-31,28),
                      child: Container(padding: EdgeInsets.symmetric(horizontal: 60,vertical: 47),
                        height: 140,
                        width: 174,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),boxShadow:  [
                          BoxShadow(
                            color: CustomColors.white1.withOpacity(.5),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0,0.0), // shadow direction: bottom right
                          )],
                          color: CustomColors.light1.withOpacity(.5),),
                        child: SvgPicture.asset(IconAssets.live),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 96,),
              Center(child: Text("No live classes \navailable",style: Theme.of(context).textTheme.headline3 ,textAlign: TextAlign.center,)),
            ],
          )
          :SingleChildScrollView(padding: EdgeInsets.only(left: 16,right: 16,top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
            Stack(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(
            height: 230,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(
                        ImageAssets.liveClass,
                      ),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  color: CustomColors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 5, top: 7, bottom: 7, right: 1),
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        "Live",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(IconAssets.play)),
            ),

            ]),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Expanded(child: Text("Elements of Information Security(CIA-Triad), Non-repudiation, Authenticity",style: Theme.of(context).textTheme.subtitle2,)),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(IconAssets.user,color: CustomColors.light2,height: 14,),
                            SizedBox(width: 10,),
                            Text("Teacher name",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 2,),
                            SvgPicture.asset(IconAssets.clock,color: CustomColors.light2,height: 12,),
                            SizedBox(width: 10,),
                            Text("May 25th | 10.30 PM",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                          ],
                        ),

                      ],
                    ),
                    MaterialButton(
                      color: CustomColors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {},
                      child: Center(
                          child: Text(
                            "Join",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.white),
                          )),
                    ),
                  ],
                )

              ],
        ),
            SizedBox(height: 21,),
            Divider(color: CustomColors.light1,thickness: 1,),
            SizedBox(height: 24,),
            Text("Upcoming Lives",style: Theme.of(context).textTheme.subtitle1,),
            SizedBox(height: 16,),
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: liveClassModel.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: const Radius.circular(16))),
                      builder: (BuildContext context){
                        return Wrap(
                          children: [
                            Container(
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
                                          child: SvgPicture.asset(IconAssets.close,height: 16,)),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Expanded(child: Text("Information Gathering Techniques Blah Blah",style: Theme.of(context).textTheme.headline3,)),
                                    ],
                                  ),
                                  SizedBox(height: 19,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.user,color: CustomColors.light2,height: 14,),
                                      SizedBox(width: 10,),
                                      Text("Teacher name",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    children: [
                                      SizedBox(width: 2,),
                                      SvgPicture.asset(IconAssets.clock,color: CustomColors.light2,height: 12,),
                                      SizedBox(width: 10,),
                                      Text("May 25th | 10.30 PM",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),

                                    ],
                                  ),
                                  SizedBox(height: 24,),
                                  Text("The blended training methodology coupled with practical "
                                      "hands-on experience with highly equipped classroom infrastructure "
                                      "and the best of internationally certified trainers makes us unique."
                                      "The blended training methodology coupled with practical hands-on experience "
                                      "with highly equipped classroom infrastructure and the best of internationally "
                                      "certified trainers makes us unique.The blended training methodology coupled with "
                                      "practical hands-on experience with highly equipped classroom infrastructure and "
                                      "the best of internationally certified trainers makes us unique.",
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.bglte),),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                    },
                    child: Column(
                      children: [
                        Container(padding: EdgeInsets.only(left: 2,right: 6,top: 6,bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height:131,
                                    width:107,
                                    decoration: BoxDecoration(borderRadius:
                                    BorderRadius.circular(12),image: DecorationImage(image: AssetImage( liveClassModel[index].bannerUrl.toString(),), fit: BoxFit.fill,)),
                                   ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      liveClassModel[index].topicName.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2,
                                    ),
                                    SizedBox(height: 27,),
                                    Row(
                                      children: [
                                        SvgPicture.asset(IconAssets.user,color: CustomColors.light2,height: 14,),
                                        SizedBox(width: 10,),
                                        Expanded(child: Text(liveClassModel[index].teacherName.toString(),style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),)),
                                      ],
                                    ),
                                    SizedBox(height: 12,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 2,),
                                            SvgPicture.asset(IconAssets.clock,color: CustomColors.light2,height: 12,),
                                            SizedBox(width: 10,),
                                            Text(liveClassModel[index].date.toString()

                                                +" | 10.30 PM",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),

                                          ],
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(IconAssets.right,color: CustomColors.light2,height: 12,),
                                        //SizedBox(width: 19,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  );
                }),
            SizedBox(height: 40,),
          ],
        ),
      )
    );
  }
}
