import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/screen/example.dart';
import 'package:redteam_xperience/screen/home.dart';
import 'package:redteam_xperience/screen/login/login_screen.dart';
import 'package:redteam_xperience/screen/my_courses.dart';
import 'package:redteam_xperience/screen/notification_screen.dart';
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
    MyCourses(),
    NotificationScreen(),
    Example()
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
                  ?const Color(0xFFD42828)
              :const Color(0xFFB0ADAD),),
                label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.mycourse,color:
              _selectedIndex==1
                  ?const Color(0xFFD42828)
                  :const Color(0xFFB0ADAD),),
              label: 'Course'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.notification,color:
              _selectedIndex==2
                  ?
              const Color(0xFFD42828)
                  :const Color(0xFFB0ADAD),),
                label: 'Notification'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.user,color:
              _selectedIndex==3
                  ?const Color(0xFFD42828)
                  :const Color(0xFFB0ADAD),),
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
