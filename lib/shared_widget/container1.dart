import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:decorated_icon/decorated_icon.dart';

class Container1 extends StatelessWidget {
  Container1({required this.icon,required this.title});
  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: (MediaQuery.of(context).size.width-40)/2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(156),color: CustomColors.white1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(156), color: CustomColors.red.withOpacity(.2),),
                padding: const EdgeInsets.all(13.0),
                  child: Center(child: SvgPicture.asset(icon,color: CustomColors.red,))),
            ),
           // Spacer(),
            Center(child: Text(title,style: Theme.of(context).textTheme.subtitle1,)),
          ],
        ),
      ),
    );
  }
}
