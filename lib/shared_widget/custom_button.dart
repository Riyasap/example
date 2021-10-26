import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onPressed,
        required this.title,
        this.elevation,
        this.radius,
        this.padding,
        this.size,
        this.color=CustomColors.red,
        this.child=false,
        this.rate,
        this.textColor,
        });
  final VoidCallback? onPressed;
  final String title;
  final double? elevation;
  final EdgeInsets? padding;
  final MaterialStateProperty<Size>? size;
  final Color color;
  final Color? textColor;
  final bool child;
  final String? rate;
  final double? radius;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: child==true?
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text("₹ $rate",style: Theme.of(context).textTheme.button!.copyWith(
                color:Colors.white,fontSize: 16,fontWeight: FontWeight.normal,),),
            ),
            Spacer(),
            Text(title,style: Theme.of(context).textTheme.button!.copyWith(
              color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal,),),
            Padding(
              padding: const EdgeInsets.only(left:8,right: 29),
              child: SvgPicture.asset(IconAssets.arrowright,color: Colors.white,),
            ),

          ],)
          :Text(title,style: Theme.of(context).textTheme.button!.copyWith(
          color: textColor??Colors.white,fontSize: 16,fontWeight: FontWeight.normal,),),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.button),
        minimumSize: size ?? MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,54),),
        padding: MaterialStateProperty.all(padding ?? const EdgeInsets.symmetric(vertical: 16)),
        elevation: MaterialStateProperty.all(elevation ?? 0),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
        ),
      ),
    );
  }
}

