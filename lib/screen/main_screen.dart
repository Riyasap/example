import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/screen/example.dart';
import 'package:redteam_xperience/screen/home.dart';
import 'package:redteam_xperience/screen/my_courses.dart';
import 'package:redteam_xperience/screen/notification_screen.dart';
import 'package:get/get.dart';
import '../core/constants/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  int bottomSelectedIndex = 0;
  PageController pageController=PageController(initialPage: 0,);
  static const List<Widget> widgetOptions = <Widget>[
    Home(),
    MyCourses(),
    NotificationScreen(),
    Example()
  ];

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 79,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.home,
                  color: selectedIndex == 0
                      ? const Color(0xFFD42828)
                      : const Color(0xFFB0ADAD),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.mycourse,
                  color: selectedIndex == 1
                      ? const Color(0xFFD42828)
                      : const Color(0xFFB0ADAD),
                ),
                label: 'Course'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.notification,
                  color: selectedIndex == 2
                      ? const Color(0xFFD42828)
                      : const Color(0xFFB0ADAD),
                ),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.user,
                  color: selectedIndex == 3
                      ? const Color(0xFFD42828)
                      : const Color(0xFFB0ADAD),
                ),
                label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap:(index){
            bottomTapped(index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView(controller: pageController,
        onPageChanged:  (index) {
        pageChanged(index);
        },
        children: const <Widget>[
          Home(),
          MyCourses(),
          NotificationScreen(),
          Example()
        ]

      ),
    );
  }
}
