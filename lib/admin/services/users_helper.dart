import 'package:http/http.dart' as https;
import 'package:jobs_hub/admin/models/users.dart';
import 'package:jobs_hub/user/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersHelper {
  static var client = https.Client();

  static Future<List<User>?> getUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.allUsers);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var usersList = usersFromJson(response.body);
      return usersList;
    } else {
      throw Exception('Failed to get the Users');
    }
  }

  static Future<User> getUserDetails({required String userId}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, '${Config.users}/$userId');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var user = userFromJson(response.body);
      return user;
    } else {
      throw Exception('Failed to load the User Details');
    }
  }

  static Future<bool> deleteUserByAdmin({required String userId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, '${Config.users}/remove-user/$userId');
    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load the User Details');
    }
  }

  static Future<List<User>> searchUsers(String searchQuery) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, '${Config.usersSearch}/$searchQuery');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var usersList = usersFromJson(response.body);
      return usersList;
    } else {
      throw Exception('Failed to load the Users');
    }
  }
}
