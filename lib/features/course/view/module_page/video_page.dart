import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/shared_widget/video_list.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(color: Colors.white,child: SizedBox(height: 8,width: MediaQuery.of(context).size.width,)),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            color: CustomColors.red,
                            child: SizedBox(
                              height: 19,
                              width: 4,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 12, right: 16),
                              child: Text(
                                "Module Name",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ListView.separated(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(left: 21,right: 21,),
                            height: 1,
                            color: CustomColors.white2,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SizedBox(height: 16,),
                              VideoList(),
                              SizedBox(height: 16,),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
