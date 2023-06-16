import 'package:http/http.dart' as https;
import 'package:jobs_hub/user/models/response/courses/courses_response.dart';
import 'package:jobs_hub/user/services/config.dart';

class CoursesHelper {
  static var client = https.Client();

  static Future<List<CoursesResponse>?> getCourses() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.courses);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var coursesList = coursesResponseFromJson(response.body);
      return coursesList;
    } else {
      throw Exception('Failed to get the Courses');
    }
  }

  static Future<List<CoursesResponse>> searchCourses(String searchQuery) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, '${Config.coursesSearch}/$searchQuery');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var coursesList = coursesResponseFromJson(response.body);
      return coursesList;
    } else {
      throw Exception('Failed to load the Courses');
    }
  }
}
