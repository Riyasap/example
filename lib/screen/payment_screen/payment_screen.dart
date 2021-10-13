import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/shared_widget/appbar_scroll.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:redteam_xperience/shared_widget/textfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        AppBarScroll(
          title: "Payment",
          image: ImageAssets.appBarImage2,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 57),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CustomColors.bglte,
                      ),
                      height: 99,
                      width: 99,
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: SvgPicture.asset(
                          IconAssets.user,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 130, left: 74),
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 9, top: 6, left: 1),
                          child: SvgPicture.asset(IconAssets.camera),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Name",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: TextFieldCustom(
                    hint: "Enter name here",
                    keyboard: TextInputType.name,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 16,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Phone Number",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: TextFieldCustom(
                    hint: "Enter Number here",
                    keyboard: TextInputType.phone,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 16,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Email ID",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 16, right: 16, bottom: 20),
                  child: TextFieldCustom(
                    hint: "Eg: Johndoe@gmail.com",
                    keyboard: TextInputType.emailAddress,
                  )),
               CustomButton(
                title: "Next",
                onPressed: (){//Todo change navigation
                  Get.offNamed('home');
                },
                padding: EdgeInsets.only(left: 24, right: 24),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
