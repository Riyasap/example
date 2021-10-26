import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/core/controller/user_controller.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/shared_widget/appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
  var currentFocus;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  String num = "";
  UserController userController=UserController();
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        appBar: AppBarCustom(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                  child: Text(
                "Enter OTP code send to",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: CustomColors.black),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Center(
                  child: Text(
                loginController.phoneNumber.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: CustomColors.black),
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: PinCodeTextField(textStyle: const TextStyle(color: CustomColors.light2),
                animationType: AnimationType.scale,
                autoFocus: true,
                enableActiveFill: true,
                enablePinAutofill: true,
                showCursor: true,
                cursorColor: CustomColors.light1,
                length: 6,
                keyboardType: TextInputType.phone,
                pinTheme: PinTheme(
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  selectedColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderWidth: 2,
                  borderRadius: BorderRadius.circular(16),
                  fieldHeight: 54,
                  fieldWidth: 54,
                ),
                onChanged: (value) {
                  num = value;
                  print(num);
                },
                appContext: (context),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                "Didn't receive OTP code ?",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: CustomColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: RichText(
                text: TextSpan(
                    text: "Resend Code",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: CustomColors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Resend Code');
                      }),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 24, top: 72),
              child: CustomButton(
                title: "Submit",
                onPressed: () {
                  //TODO number Function
                  // if(num.length==6)
                  //userController.verify2(num);
                  Get.offAndToNamed('register');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
