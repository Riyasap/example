import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class AppBarScroll extends StatefulWidget {
  AppBarScroll({Key? key,
    required this.title,
    required this.image,
}) : super(key: key);
  String title;
  String image;

  @override
  _AppBarScrollState createState() => _AppBarScrollState();
}

class _AppBarScrollState extends State<AppBarScroll> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(title: Text(widget.title,style: Theme.of(context).textTheme.bodyText1,),centerTitle: true,floating: true,
      pinned: true,backgroundColor: Colors.black.withOpacity(.8),
      collapsedHeight: 56,iconTheme: const IconThemeData(color: Colors.black),
      expandedHeight: 196.0,
      flexibleSpace:
      DecoratedBox(
        decoration: const BoxDecoration(
          //color: Colors.yellow
        ),

        child:SafeArea(
          child: FlexibleSpaceBar(
            background: Container(
              color: CustomColors.red,
              child: Stack(
                children: [
                  Image.asset(widget.image,fit: BoxFit.fill,),
                  Padding(
                    padding: const EdgeInsets.only(top: 32,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome to",style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),),
                        Text("Redteam",style: Theme.of(context).textTheme.headline1!.copyWith(color: CustomColors.black),),
                      ],
                    ),
                  )
                ],
              ),padding:const EdgeInsets.only(top: 59,left: 35),),
          ),
        ),),
    );
  }
}
