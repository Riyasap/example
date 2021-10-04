import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redteam_xperience/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const MyApp());
}

initApp() async {
  print("App Started");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getApp();
  }

  Widget getApp() {
    return GetMaterialApp(
      title: "RedTeam Xperience",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:TextTheme(
          //Example
          headline1: GoogleFonts.openSans(
              fontSize: 95,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5
          ),
        ),
      ),
      home: _decideMainPage(),

    );
  }
}
_decideMainPage() {

  // OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //   // will be called whenever a notification is opened/button pressed.
  //   Get.to(NotificationScreen());
  // });
  //
  // if (PreferenceUtils.getString(Const.USER_ID).isNullOrBlank) {
  //   //logged out
  //   return PhoneScreen();
  // }
  // if(PreferenceUtils.getString(Const.STUDENT_ID).isNullOrBlank)
  // {//student not set
  //   return StudentRegistrationScreen(RegMode.MODE_ADD,false);
  // }
  //else
    return MainScreen();
}


