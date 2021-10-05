import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:redteam_xperience/core/constants/config.dart';
import 'package:redteam_xperience/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  initOneSignal();
  runApp(const MyApp());
}
Future<void> initOneSignal() async {

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  await OneSignal.shared.setAppId(Config.RAZORPAY_KEY);
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted)
  {
    print("Accepted permission: $accepted");
  });
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
          headline1: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 34,
              height: 1.3,
              color: Color(0x0)
          ),
          headline3:GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 1.38,
            letterSpacing: 1,
              color: Color(0x0)
          ),
          subtitle1: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            letterSpacing: 1,
              color: Color(0x0)
          ),
          subtitle2: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.42,
            letterSpacing: 1,
            color: Color(0x0)
          ),
          bodyText1: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              height: 1.5,
              letterSpacing: 1,
              color: Color(0x0)
          ),
          bodyText2: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              height: 1.4,
              letterSpacing: 1,
              color: Color(0x0)
          ),
          caption: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              height: 1.6,
              letterSpacing: 1,
              color: Color(0x0)
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


