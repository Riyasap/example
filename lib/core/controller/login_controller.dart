import 'dart:convert';
import 'package:redteam_xperience/core/controller/controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:redteam_xperience/screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Controller {

  var phoneNumber = "".obs;
  var userName = "".obs;
  var email = "".obs;
  // var isLoading = false.obs;
  // var msg = "".obs;
  void changePhoneNumber(String value) => phoneNumber.value = value;
  void changeUserName(String value) => userName.value = value;


  Future login() async {
    if(userName.value.isNotEmpty && phoneNumber.value.isNotEmpty){
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({
            "email": userName.value.toString(),
            "password": phoneNumber.value.toString(),
          })
      );
      if(response.statusCode==200){
        final body =jsonDecode(response.body);
        print('Login token~~~~'+ body["token"]);
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login token~~~~'+ body["token"])));
        Get.snackbar("login","Login token~~~~"+ body["token"]);
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("login", body["token"]);
        //loginController.userName=nameCont.toString() as RxString;
        Get.to(()=>MainScreen());
      }else{Get.snackbar("retry", "invalid Credential~~~~~~");

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid Credential~~~~~~")));
      }
    }
    else{
      Get.snackbar("enter data", "No Data");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Data")));

    }
  }


}