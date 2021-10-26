import 'package:firebase_auth/firebase_auth.dart';
import 'package:redteam_xperience/core/controller/controller.dart';
import 'package:get/get.dart';
import 'package:redteam_xperience/screen/main_screen.dart';
import 'package:redteam_xperience/screen/otp/otp_screen.dart';
import 'package:redteam_xperience/screen/register/register_screen.dart';

class UserController extends Controller {
  FirebaseAuth auth = FirebaseAuth.instance;

  var selectedNavIndex = 0.obs;
  // var home = HomeModel().obs;
  // var profile = ProfileResponse().obs;
  // var bookmarks = BookmarksModel().obs;
  // var classInfo = ClassInfoResponse().obs;

  var phoneNumber = "".obs;
  var resendToken = 0.obs;
  var verificationId = "".obs;
  var isLoading = false.obs;
  var msg = "".obs;
  var smsCode = "".obs;

  verify(String phoneNumber) async {
    print("verify called");
    // this.isLoading.value = true;
    // this.phoneNumber.value = phoneNumber;


    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: onCodeSent,
      timeout: Duration(minutes: 2),
      codeAutoRetrievalTimeout: autoRetrievalTimeOut,
    );
  }

  void signInWithPhoneCredential()async{
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId.toString(),
        smsCode: this.smsCode.toString(),
      );

      final User? user = (await auth.signInWithCredential(credential)).user;

      Get.snackbar("Success","Successfully signed in UID: ${user?.uid}");
    } catch (e) {
      Get.snackbar("Failed","Failed to sign in: " + e.toString());
    }
  }


  verificationCompleted(PhoneAuthCredential credential) async {

    await auth.signInWithCredential(credential);
    Get.snackbar("Verification Completed", "Phone number automatically verified and user signed in: ${auth.currentUser?.uid}");
  }
  verificationFailed(FirebaseAuthException e) {

    Get.snackbar("Phone number verification failed. Code: ${e.code}", "${e.message}");
  }
  onCodeSent(String verificationId, int? resendToken) async{
   Get.snackbar("code sent", "Please check your phone for the verification code.");
   this.verificationId=verificationId as RxString;
  }

  autoRetrievalTimeOut(String verificationId) async{
   Get.snackbar("Timeout", "Verification code "+ verificationId);
   this.verificationId=verificationId as RxString;
    print(verificationId);
  }

  verify2(String userEnteredOtp) async {
    //manually entering otp
    print("verify-manual called");
    this.isLoading.value = true;
    this.smsCode=userEnteredOtp as RxString;
    //signInWithPhoneCredential();
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: userEnteredOtp);
    // Sign the user in (or link) with the credential
    try {
      await auth.signInWithCredential(phoneAuthCredential).then((value) {
        print(value);
        if (value.user != null) //screens.login success full
            {

              Get.offAndToNamed('register');
          //tryLogin(); //login with our server
        }
      });
    } catch (e) {
      switch (e) {
        case "invalid-verification-code":
          msg.value = "Invalid SMS Code";
          print(e);
          break;
        default:
          print('~~~~~Fail~~~~');
          print(phoneAuthCredential);
          msg.value = e.toString();
          print(e);
          break;
      }
    }
    this.isLoading.value = false;
  }


}