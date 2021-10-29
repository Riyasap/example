import 'package:flutter/material.dart';
import 'package:redteam_xperience/core/controller/controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/features/course/view/module_page/material_page.dart';
import 'package:redteam_xperience/features/course/view/module_page/video_page.dart';
import 'package:redteam_xperience/shared_widget/tabbar.dart';

class ModuleDetails extends StatefulWidget {
  const ModuleDetails({Key? key}) : super(key: key);

  @override
  _ModuleDetailsState createState() => _ModuleDetailsState();
}

class _ModuleDetailsState extends State<ModuleDetails>with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController= TabController(length: 3, vsync:this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom:TabBarCustom(),
          backgroundColor: Colors.white,
          iconTheme: IconTheme.of(context).copyWith(color: CustomColors.black),
          title: Text(
            "Module 1",
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: TabBarView(
          children: [
            VideoPage(),
            AllMaterialScreen(),
            Icon(Icons.directions_bike),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: new Text('FLOATING TO CHANGE'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
