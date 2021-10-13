import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/screen/register/register_screen.dart';
import 'package:redteam_xperience/screen/get_started/get_started.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/container1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/assets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: GoogleFonts.poppins(
                            fontSize: 34,
                            color: CustomColors.black,
                            height: 1.4,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Patrice Evra",
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 63,
                    height: 63,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(29)),
                    child: Image.asset(ImageAssets.user),
                  )
                ],
              ),
              GridView.count(crossAxisCount: 2,
              childAspectRatio: 2,
              shrinkWrap: true,

              children: [
                Container1(
                  icon: IconAssets.live,
                  title: "Live",
                ),
                Container1(
                  icon: IconAssets.exam,
                  title: "Exams",
                ),
                Container1(
                  icon: IconAssets.events,
                  title: "Events",
                ),
                Container1(
                  icon: IconAssets.forum,
                  title: "Forum",
                ),
              ],
              ),
              Container1(
                icon: IconAssets.live,
                title: "Live",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
