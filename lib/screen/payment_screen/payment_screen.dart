import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/shared_widget/appbar_scroll.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:redteam_xperience/shared_widget/dropdown_menu.dart';
import 'package:redteam_xperience/shared_widget/textfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String dropdownValue = 'One';
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
              const SizedBox(
                height: 48,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Course",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                  child: DropDownCustoms(
                      hint: "Select the Course",
                      itemList: ["ADBC", "EDJC", "HDCA"])),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 24,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Branch",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                child: DropDownCustoms(
                  hint: "Select Branch",
                  itemList: <String>["First", "Second"],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 24,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Supportive Executive",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 20),
                child: DropDownCustoms(
                  hint: "Select Executive",
                  itemList: <String>["one", "two"],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 24,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Refered by",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: CustomColors.light2)),
                    const TextSpan(
                        text: "*", style: TextStyle(color: CustomColors.red)),
                  ]),
                ),
              ),
              const Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 24),
                  child: TextFieldCustom(
                    hint: "Refered by",
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: CustomButton(
                  child: true,
                  rate: "2000",
                  title: "Next",
                  onPressed: () {
                    //Todo change navigation
                    Get.offAllNamed('/');
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
