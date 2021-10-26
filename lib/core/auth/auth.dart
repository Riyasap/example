// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
// import 'package:redteam_xperience/screen/otp/otp_screen.dart';
//
// verificationCompleted(PhoneAuthCredential credential) async {
//   //auto fetch
//   // Sign the user in (or link) with the auto-generated credential
//   auth.signInWithCredential(credential).then((value) {
//     print(value);
//     if (value.user != null)
//     {
//       tryLogin(); //login with our server
//     }
//   });
// }
// verificationFailed(FirebaseAuthException e) {
//   switch (e.code) {
//     case "invalid-phone-number":
//       msg.value = "Invalid Phone Number";
//       break;
//     default:
//       msg.value = e.message;
//   }
// }
// onCodeSent(String verificationId, int resendToken) {
//   print("code sent");
//   this.isLoading.value = false;
//   this.verificationId.value = verificationId;
//   this.resendToken.value = resendToken;
//   Get.to(OtpScreen(),transition: Transition.rightToLeft);
// }
//
// autoRetrievalTimeOut(String verificationId) {
//   print("Timeout");
//   print(verificationId);
// }
