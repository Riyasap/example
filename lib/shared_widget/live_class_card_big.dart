import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/live_classes/model/live_class_model.dart';

class LiveClassCardBig extends StatelessWidget {
  LiveClassCardBig({required this.liveClassModel});

  LiveClassModel liveClassModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 293,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: CustomColors.black,
      ),
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 230,
            foregroundDecoration: BoxDecoration(

                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      CustomColors.black,
                      CustomColors.black.withOpacity(0),
                    ],
                    stops: [
                      0.1,
                      0.9
                    ])),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft:
                Radius.circular(16),topRight: Radius.circular(16)),
                image: DecorationImage(
                    image: AssetImage(
                      liveClassModel.bannerUrl!,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 154),
                child: Text(
                  liveClassModel.moduleName!,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 6),
                child: Text(
                  liveClassModel.topicName!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.white),
                ),
              ),
              Padding(
                //Todo Live Class Image brocken change padding
                padding: const EdgeInsets.only(left: 16, top: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundColor: CustomColors.white1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 19,
                      ),
                      child: MaterialButton(
                        color: CustomColors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {},
                        child: Center(
                            child: Text(
                              "+ Join",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
