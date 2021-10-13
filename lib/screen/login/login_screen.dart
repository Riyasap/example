import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
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
  TextEditingController _controller = new TextEditingController();
  LoginController loginController = Get.find();
  String num = "";
  String _chosenValue="Android";
  var currentFocus;


  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.
    hasPrimaryFocus) {
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
  final Map<String, int> discBasis = {
    'Age': 1,
    'Ancestry': 2,
    'Color': 3,
    'Disability': 4,
    'Race': 5,
    'Religion': 6,
    'Sex': 7,
    'Familial Status': 8,
    'National Origin': 9
  };


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
                SizedBox(
                  height: 15,
                ),
                Center(
                    child: Text(
                  "Verify your mobile number",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                )),
                SizedBox(
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(

                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 8,left: 8),
                      child:
                      DropdownButton<String>(
                        focusColor:Colors.white,
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          'Android',
                          'IOS',
                          'Flutter',
                          'Node',
                          'Java',
                          'Python',
                          'PHP',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style:TextStyle(color:Colors.white),),
                          );
                        }).toList(),
                        hint:Text(
                          "Please choose a langauage",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        // onChanged: (String value) {
                        //   setState(() {
                        //     _chosenValue = value;
                        //   });
                        // },
                      ),
                      //Text("+91",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                    ),
                      // prefix: CountryCodePicker(
                      //   hideMainText: true,
                      //   padding: EdgeInsets.all(0),
                      //   onChanged: print,
                      //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      //   initialSelection: 'IN',
                      //   favorite: ['+91', '+33', '+971', '+974', '+34', '+880'],
                      //   // optional. Shows only country name and flag
                      //   //showCountryOnly: true,
                      //   // optional. Shows only country name and flag when popup is closed.
                      //   showOnlyCountryWhenClosed: false,
                      //   showFlagDialog: true,
                      //   // optional. aligns the flag and the Text left
                      //   alignLeft: true,
                      // ),
                      fillColor: CustomColors.bglte,
                      filled: true,
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: CustomColors.red),
                          borderRadius: BorderRadius.circular(16)),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "Enter the Number",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: CustomColors.light2),
                        ),
                      ),
                      labelStyle: TextStyle(fontSize: 30),
                      suffixIcon: Icon(Icons.accessibility_rounded)),
                  onChanged: (value) {
                    num = value;
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: CustomColors.light2),
                            children: [
                              TextSpan(
                                text:
                                    "By creating passcode you agree with our\n",
                              ),
                              TextSpan(
                                  text: "Terms & Conditions",
                                  style: TextStyle(color: CustomColors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Terms And Conditons~~~~~~~');
                                    }),
                              TextSpan(text: "\tand"),
                              TextSpan(
                                  text: "\tPrivacy policy",
                                  style: TextStyle(color: CustomColors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Privacy policy~~~~~~~');
                                    }),
                            ])),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: CustomButton(
                    title: "Get OTP",
                    onPressed: () {
                      if (num.length == 10) {
                        loginController.changePhoneNumber(num);
                        Get.toNamed('otp');
                      } else {
                        return null;
                      }
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
