import 'package:redteam_xperience/model/user_model.dart';
import '../../model/user_model.dart';
abstract class HomeRepository {
  Future<List<UserModel>> GetCurrentUser();
}

// class HomeRepositoryImpl implements HomeRepository {
//   late final HttpClient _client;
//   @override
//   Future<List<UserModel>> getCurrentUser() async {
//     final response = await _client.get(
//         "${URLs.home + "/" + (AuthStore.to.user?.id ?? "00")}",
//         authorization: true);
//     return (response["data"] as List).map<UserModel>((response) {
//       debugPrint(response.toString());
//       print("response.toString()");
//       return UserModel.fromJson(response);
//     }).toList();
//   }
//
//
// }