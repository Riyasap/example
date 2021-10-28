import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';

class ExpiredCourse extends StatelessWidget {
  const ExpiredCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:131,
      width:107,
      // foregroundDecoration: BoxDecoration(
      //
      //     borderRadius:
      //     BorderRadius.circular(12),
      //  ),
      decoration: BoxDecoration(

          borderRadius:
      BorderRadius.circular(12)),
      child: Stack(//fit: StackFit.passthrough,
        children: [
          Image.asset(ImageAssets.expiredImage),
          Container( decoration: BoxDecoration(borderRadius:
          BorderRadius.circular(12),
            gradient: LinearGradient(
                colors: [Colors.black.withOpacity(.7),Colors.black.withOpacity(.7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter

            ),),),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: SvgPicture.asset(IconAssets.lockCircle,)),
            ),
          Center(child: Transform.translate(
              offset: Offset(0,30),
              child: Text("data",style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),)))

          // Column(mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(IconAssets.lockCircle),
          //     Text("data",style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),)
          //   ],
          // ),
        ],
      ),
    );
  }
}
