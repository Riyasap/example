import 'package:redteam_xperience/core/controller/controller.dart';
import 'package:get/get.dart';

class UserController extends Controller {
  //FirebaseAuth auth = FirebaseAuth.instance;

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
}