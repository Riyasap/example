import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/screen/home.dart';
import 'package:redteam_xperience/screen/login/login_screen.dart';
import 'package:redteam_xperience/screen/register/register_screen.dart';
import 'package:redteam_xperience/screen/get_started/get_started.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:redteam_xperience/shared_widget/container1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    //TODO St Navigation Bottom
    Text(
      'Index 1: Booking',

    ),
    Text(
      'Index 2: Notification',

    ),
    Text(
      'Index 3: Profile',

    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(height: 79,
        child: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.home,color:
              _selectedIndex==0
                  ?Color(0xFFD42828)
              :Color(0xFFB0ADAD),),
                label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.book,color:
              _selectedIndex==1
                  ?Color(0xFFD42828)
                  :Color(0xFFB0ADAD),),
              label: 'Course'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.notification,color:
              _selectedIndex==2
                  ?Color(0xFFD42828)
                  :Color(0xFFB0ADAD),),
                label: 'Notification'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.user,color:
              _selectedIndex==3
                  ?Color(0xFFD42828)
                  :Color(0xFFB0ADAD),),
                label: 'Profile'
            ),
        ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
        ),
      ),
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
