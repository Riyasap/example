
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({Key? key}) : super(key: key);

  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarCustom(
        title: "Live Classes",
        color: Colors.white.withOpacity(.8),
      ),
      body: SingleChildScrollView(padding: EdgeInsets.only(left: 16,right: 16,top: 25),
        child: Column(
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
                  image: DecorationImage(
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
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
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
                                  BorderRadius.circular(12),image: DecorationImage(image: AssetImage( ImageAssets.lock,), fit: BoxFit.fill,)),
                                 ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Information Gathering Techniques",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2,
                                ),
                                SizedBox(height: 27,),
                                Row(
                                  children: [
                                    SvgPicture.asset(IconAssets.user,color: CustomColors.light2,height: 14,),
                                    SizedBox(width: 10,),
                                    Text("Teacher name",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),
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
                                        Text("May 25th | 10.30 PM",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: CustomColors.light2),),

                                      ],
                                    ),
                                    SizedBox(width: 32,),
                                    SvgPicture.asset(IconAssets.right,color: CustomColors.light2,height: 12,),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                    ],
                  );
                }),
            SizedBox(height: 40,),
          ],
        ),
      )
    );
  }
}
