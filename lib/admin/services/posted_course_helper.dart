import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:jobs_hub/admin/models/course_req.dart';
import 'package:jobs_hub/user/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostedCoursesHelper {
  static var client = https.Client();

  static Future<bool> addACourse(CourseReqModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };
    var url = Uri.https(Config.apiUrl, Config.courses);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
