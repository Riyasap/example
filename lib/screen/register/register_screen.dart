import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/shared_widget/appbar_scroll.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:redteam_xperience/shared_widget/textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var currentFocus;

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  LoginController loginController = Get.find();
  String name="";
  String num="";

  final formKey = GlobalKey<FormState>();
  var passCont = TextEditingController();
  var nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          AppBarScroll(title: "Create Account", image: ImageAssets.appBarImage1),
          SliverList(
            delegate: SliverChildListDelegate(
                 [
                   Center(
            child:Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 57),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [
                      6,4
                    ],color: CustomColors.border,
                    strokeCap: StrokeCap.square,
                    strokeWidth: 2,
                    radius: Radius.circular(16),
                    padding: EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey.shade300,),
                      // height: 99,width: 99,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 34,right: 34,top: 31,bottom: 31),
                        child: SvgPicture.asset(IconAssets.user,),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 130,left: 74),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 9,top: 6,left: 8,right: 7),
                    child: SvgPicture.asset(IconAssets.camera),
                  )
                ),
              ],
            ),),
                   const SizedBox(height: 40,),
                   Padding(
                     padding: const EdgeInsets.only(left: 16),
                     child: RichText(text: TextSpan(children: [
                       TextSpan(text: "Name",style: Theme.of(context).textTheme.bodyText2!.copyWith(color: CustomColors.light2)),
                       const TextSpan(text: "*",style: TextStyle(color: CustomColors.red)),
                     ]),),
                   ),
                   const Padding(
                       padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                       child: TextFieldCustom(
                         hint: "Enter name here",
                         keyboard: TextInputType.name,
                       )),
                   Padding(
                     padding: const EdgeInsets.only(top:32,left: 16,),
                     child: RichText(text: TextSpan(children: [
                       TextSpan(text: "Phone Number",style: Theme.of(context).textTheme.bodyText2!.copyWith(color: CustomColors.light2)),
                       const TextSpan(text: "*",style: TextStyle(color: CustomColors.red)),
                     ]),),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                     child: TextFieldCustom(
                       hint:  "Enter Number here",
                       keyboard: TextInputType.phone,
                     )),

                   Padding(
                     padding: const EdgeInsets.only(top:32,left: 16,),
                     child: RichText(text: TextSpan(children: [
                       TextSpan(text: "Email ID",style: Theme.of(context).textTheme.bodyText2!.copyWith(color: CustomColors.light2)),
                       const TextSpan(text: "*",style: TextStyle(color: CustomColors.red)),
                     ]),),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                     child: TextFieldCustom(
                       hint:  "Eg: Johndoe@gmail.com",
                       keyboard: TextInputType.phone,
                     )),

                   CustomButton(title: "Next",
                     onPressed: ()=> Get.toNamed('payment'),
                     padding: const EdgeInsets.only(left: 24,right: 24),)
                 ],
            ),
          ),
        ],),
      ),
    );
  }
}
