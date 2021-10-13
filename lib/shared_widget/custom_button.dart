import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onPressed,
        required this.title,
        this.elevation,
        this.padding,
        this.size,
        this.color=CustomColors.red,
        });
  final VoidCallback? onPressed;
  final String title;
  final double? elevation;
  final EdgeInsets? padding;
  final MaterialStateProperty<Size>? size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: Text(title,style: Theme.of(context).textTheme.button!.copyWith(
          color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal,),),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.button),
        minimumSize: size ?? MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,54),),
        padding: MaterialStateProperty.all(padding ?? const EdgeInsets.symmetric(vertical: 16)),
        elevation: MaterialStateProperty.all(elevation ?? 0),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

