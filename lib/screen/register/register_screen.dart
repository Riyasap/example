import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';
import 'package:redteam_xperience/core/controller/login_controller.dart';
import 'package:redteam_xperience/shared_widget/appbar_scroll.dart';
import 'package:redteam_xperience/shared_widget/custom_button.dart';
import 'package:redteam_xperience/shared_widget/dropdown_menu.dart';
import 'package:redteam_xperience/shared_widget/textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:redteam_xperience/core/utils/helper/file_picker.dart';
import 'package:redteam_xperience/example.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var currentFocus;
  bool isChecked = false;
  bool datePick=false;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  FilePick picker = FilePick();
  LoginController loginController = Get.find();
  String name = "";
  String num = "";
  final formKey = GlobalKey<FormState>();
  var passCont = TextEditingController();
  var nameCont = TextEditingController();
  DateTime currentDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime.now().subtract(Duration(days: 5)));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }
  final dateTime=DateTime.now().obs;
  @override
  void initState() {
    //dateTime = DateTime.now().obs;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            AppBarScroll(
                title: "Create Account", image: ImageAssets.appBarImage1),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: [6, 4],
                            color: CustomColors.border,
                            strokeCap: StrokeCap.square,
                            strokeWidth: 2,
                            radius: Radius.circular(16),
                            padding: EdgeInsets.all(0),
                            child: InkWell(
                              onTap: () {
                                picker.pickFiles();
                                print(picker.paths.toString());
                                ;
                              },
                              child: Container(
                                height: 117,
                                width: 117,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade300,
                                ),
                                // height: 99,width: 99,
                                child: picker.paths != null
                                    ? Image.asset(picker.paths.toString())
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 34,
                                            right: 34,
                                            top: 31,
                                            bottom: 31),
                                        child: SvgPicture.asset(
                                          IconAssets.user,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 135, left: 94),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 9, top: 6, left: 8, right: 7),
                              child: SvgPicture.asset(IconAssets.camera),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                      child: TextFieldCustom(
                        hint: "Enter name here",
                        keyboard: TextInputType.name,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Phone Number",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                      child: TextFieldCustom(
                        hint: "Enter number here",
                        keyboard: TextInputType.phone,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Email ID",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                      child: TextFieldCustom(
                        hint: "Eg: Johndoe@gmail.com",
                        keyboard: TextInputType.phone,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Date of birth",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: InkWell(
                          onTap: () async {
                            final DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: dateTime(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime.now(),
                              helpText: 'Select a date',
                            );
                            if (newDate != null) {
                              setState(() {
                                dateTime(newDate);
                                datePick=true;
                              });
                            }
                          },
                          child: datePick?Obx(()=>Row(
                            children: [
                              Expanded(
                                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          DateFormat.d()
                                              .format(dateTime())
                                              .toString(),style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: CustomColors.light2,fontWeight: FontWeight.bold)
                                        ),
                                      ))),
                              SizedBox(width: 12,),
                              Expanded(
                                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          DateFormat.MMM()
                                              .format(dateTime())
                                              .toString(),style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: CustomColors.light2,fontWeight: FontWeight.bold)
                                        ),
                                      ))),
                              SizedBox(width: 12,),
                              Expanded(
                                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          DateFormat.y()
                                              .format(dateTime())
                                              .toString(),style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: CustomColors.light2,fontWeight: FontWeight.bold)
                                        ),
                                      ))),
                            ],
                          ),)
                              :Obx(()=>Row(
                            children: [
                              Expanded(
                                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                            "Day",style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: CustomColors.light1)
                                        ),
                                      ))),
                              SizedBox(width: 12,),
                              Expanded(
                                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                            "Month",style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: CustomColors.light1)
                                        ),
                                      ))),
                              SizedBox(width: 12,),
                              Expanded(
                                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 22),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                            "Year",style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: CustomColors.light1)
                                        ),
                                      ))),
                            ],
                          ),)
                        ),
                      ),


                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Country",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 20, right: 24),
                    child: DropDownCustoms(hint: "Country", itemList: [
                      "India",
                      "USA",
                      "UK",
                      "Australia",
                      "UAE",
                      "Saudi Arabia"
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "State",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 20, right: 24),
                    child: DropDownCustoms(hint: "State", itemList: [
                      "India",
                      "USA",
                      "UK",
                      "Australia",
                      "UAE",
                      "Saudi Arabia"
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Pin Code",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 24, right: 24),
                      child: TextFieldCustom(
                        hint: "Enter pin code",
                        keyboard: TextInputType.phone,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Address",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 20),
                    child: TextFieldCustom(
                      hint: "House name, Street name, Appartment.. ",
                      maxLine: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 24,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Id proof",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: CustomColors.light2)),
                        const TextSpan(
                            text: "*",
                            style: TextStyle(color: CustomColors.red)),
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 20),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [6, 6],
                      color: CustomColors.light1,
                      strokeCap: StrokeCap.square,
                      strokeWidth: 2,
                      radius: Radius.circular(16),
                      padding: EdgeInsets.all(0),
                      child: Container(
                        height: 163,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(IconAssets.upload),
                              SizedBox(
                                height: 27,
                              ),
                              Text(
                                "Aadhaar / Licence / Voter id",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: CustomColors.light1),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Expanded(
                      //width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.all(CustomColors.red),
                            value: isChecked,
                            onChanged: (bool? value) {
                              isChecked = value!;
                              setState(() {});

                              print(isChecked);
                            },
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: CustomColors.light2),
                                  children: [
                                    const TextSpan(
                                      text:
                                          "By creating an account you are agreeing to the\n",
                                    ),
                                    TextSpan(
                                        text: "Terms & Conditions",
                                        style:
                                            TextStyle(color: CustomColors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Terms And Conditons~~~~~~~');
                                          }),
                                    const TextSpan(text: "\tand"),
                                    TextSpan(
                                        text: "\tPrivacy policy",
                                        style: const TextStyle(
                                            color: CustomColors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Privacy policy~~~~~~~');
                                          }),
                                  ])),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 32),
                    child: CustomButton(
                      title: "Next",
                      onPressed: () => Get.toNamed('payment'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
