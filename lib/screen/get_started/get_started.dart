import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/screen/register/register_screen.dart';
import 'package:redteam_xperience/screen/main_screen.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(ImageAssets.getStarted,fit: BoxFit.fill)),
          Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1, child: SizedBox(),),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  children: [
                    Spacer(),
                    Center(
                      child: Container(margin:  EdgeInsets.only(bottom: 20),
                        height: 67,
                        width: 200,
                        child: Image.asset(ImageAssets.logo,fit: BoxFit.fill),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 21),
                        height: 77,
                        width: 288,
                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                          ),),
                      ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 104,left: 40,right: 40),
                      child: CustomButton(title:"Get Started",
                        onPressed: ()=> Get.offAndToNamed('login'),
                      ),
                    ),
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
