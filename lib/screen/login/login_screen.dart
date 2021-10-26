import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/controller/user_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _auth = FirebaseAuth.instance;
  UserController userController=UserController();
  String selectedCountryCode = "+91";
  TextEditingController _controller = new TextEditingController();
  LoginController loginController = Get.find();
  String num = "";
  String number = "";
  String _chosenValue = "Android";
  var currentFocus;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  bool isValidPhoneNumber(String string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }
    const pattern = r'^[0-9]$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        appBar: AppBarCustom(),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Text(
                  "Verify your mobile number",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: CustomColors.black),
                )),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  //controller: _controller,
                  autofocus: true,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      color: CustomColors.light2,
                      letterSpacing: 1,
                      fontSize: 20),
                  decoration: InputDecoration(
                      prefixIcon:  CountryCodePicker(flagWidth: 46,
                        onChanged: (value) {
                          selectedCountryCode = value.toString();
                          print(selectedCountryCode);
                      },
                        padding: const EdgeInsets.only(left: 8,right: 0),
                        initialSelection: '+91',
                        favorite: const ['+91','+971','+973'],
                        //showCountryOnly: true,
                        showFlagMain: true,
                        showOnlyCountryWhenClosed: false,
                        showFlagDialog: true,
                        hideMainText: true,
                        alignLeft: false,
                        flagDecoration: const BoxDecoration(shape: BoxShape.circle,),
                      ),

                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      hintText: "Enter the Number",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: CustomColors.light2),

                  ),
                  onChanged: (value) {
                    num =value;
                    number = selectedCountryCode + value;
                  },
                ),
                const Spacer(),

                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: CustomButton(
                    title: "Get OTP",
                    onPressed: () async {
                      //TODO function Number
                      //   if (num.length == 10) {
                      //     loginController.changePhoneNumber(num);
                      //     userController.verify(number);
                           Get.toNamed('otp');
                    //}
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
