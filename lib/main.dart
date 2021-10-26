import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:redteam_xperience/core/constants/config.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/screen/home.dart';
import 'package:redteam_xperience/screen/login/login_screen.dart';
import 'package:redteam_xperience/screen/otp/otp_screen.dart';
import 'package:redteam_xperience/screen/payment_screen/payment_screen.dart';
import 'package:redteam_xperience/screen/register/register_screen.dart';
import 'package:redteam_xperience/screen/main_screen.dart';
import 'package:redteam_xperience/screen/get_started/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  initOneSignal();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
Future<void> initOneSignal() async {

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  await OneSignal.shared.setAppId(Config.ONESIGNAL_APP_ID);
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted)
  {
    print("Accepted permission: $accepted");
  });
}


initApp() async {
  print("App Started");
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    //TODO add function shared prefererance
    //checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return getApp();
  }
  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));
  Widget getApp() {
    return GetMaterialApp(
      title: "RedTeam Xperience",
      themeMode: ThemeMode.system,
      //darkTheme: _darkTheme,
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.background,
        textTheme:TextTheme(
          headline1: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 34,
              height: 1,
            color: CustomColors.black,
          ),
            headline2:GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 1.32,
              color: CustomColors.black,
              //letterSpacing: 1,
            ),
          headline3:GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 1.38,
            color: CustomColors.black,
            //letterSpacing: 1,
          ),
          subtitle1: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: CustomColors.black,
            //letterSpacing: 1,
          ),
          subtitle2: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.42,
            color: CustomColors.black,
            //letterSpacing: 1,
          ),
          bodyText1: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              height: 1.5,
            color: CustomColors.black,
              //letterSpacing: 1,
          ),
          bodyText2: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              height: 1.4,
            color: CustomColors.black,
              //letterSpacing: 1,
          ),
          caption: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              height: 1.6,
            color: CustomColors.black,
              //letterSpacing: 1,
          ),
          button: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: CustomColors.black,
          ),
          headline4: GoogleFonts.poppins( //button 2
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 1.5,
            color: CustomColors.black,
        )
        ),
      ),
      routes: {
        '/': (context) => const MainScreen(),
        'login': (context) => const LoginScreen(),
        'getStarted': (context) => const GetStarted(),
        'register': (context) => RegisterScreen(),
        'otp': (context) => const OtpScreen(),
        'payment': (context) => const PaymentScreen(),
        'home': (context) => const Home(),

      },
      initialRoute: '/',
    );
  }
}
void checkLogin() async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  String? value = pref.getString("login");
  if (value !=null){
    Get.toNamed('/');
  }
}

//
// _decideMainPage() {
//
//   OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//     // will be called whenever a notification is opened/button pressed.
//     Get.to(NotificationScreen());
//   });
//
//   if (PreferenceUtils.getString(Const.USER_ID).isNullOrBlank) {
//     //logged out
//     return PhoneScreen();
//   }
//   if(PreferenceUtils.getString(Const.STUDENT_ID).isNullOrBlank)
//   {//student not set
//     return StudentRegistrationScreen(RegMode.MODE_ADD,false);
//   }
//   else
//     return RegisterScreen();
// }


