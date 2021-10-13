import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{
   AppBarCustom({Key? key,
     this.title="",
     this.elevation=0.0,
     this.trailing=const SizedBox(),
     this.border=false,
  }) : super(key: key);

  final String title;
  final double elevation;
  final Widget trailing;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: border
          ? PreferredSize(preferredSize: const Size.fromHeight(1),
      child: Container(color: CustomColors.bglte,height: 1,),)
          : null,
      backgroundColor: CustomColors.black.withOpacity(.8),
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      actions: [
        trailing
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
