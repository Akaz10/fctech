import 'package:fctech/model/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static fetchUser() async {
    http.Response response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/users")); //.timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(response.body);
      return userFromJson(jsonString);
    } else {
      return null;
    }
  }

  static fetchUserDetail(String userId) async {
    http.Response response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/users/$userId")); //.timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(response.body);
      return userDetailFromJson(jsonString);
    } else {
      return null;
    }
  }

}