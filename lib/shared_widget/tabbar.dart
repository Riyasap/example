import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
class TabBarCustom extends StatelessWidget with PreferredSizeWidget{
  const TabBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(//padding: const EdgeInsets.all(4),
          height: 50,
          margin: const EdgeInsets.only(left: 20,right: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),border: Border.all(color: CustomColors.white1,width: 1)),
          child:  TabBar(//controller: tabController,
            labelColor: Colors.white,
            labelStyle: Theme.of(context).textTheme.subtitle2,
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(4),
            unselectedLabelColor: CustomColors.light2,
            unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
            indicator: BoxDecoration(
              color: CustomColors.black,
              borderRadius: BorderRadius.circular(180),
            ),
            tabs: const [
              Tab(
                text: 'Videos',

              ),
              Tab(
                text: 'Materials',
              ),
              Tab(
                text: 'Assignment',
              ),
            ],
          ),
        ),
        SizedBox(height: 12,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(60);

}
