import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class Container1 extends StatelessWidget {
  Container1({required this.icon,required this.title});
  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167,
      height: 74,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(156),color: CustomColors.white1),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.33,horizontal: 13.33),
              width: 54,
              height: 54,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(156),color: CustomColors.red.withOpacity(.2)),
              child: SvgPicture.asset(icon),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14,top: 25,bottom: 25),
            child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
          ),
        ],
      ),
    );
  }
}
