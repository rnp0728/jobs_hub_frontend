import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:jobs_hub/recruiter/models/applicants.dart';
import 'package:jobs_hub/user/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicantsHelper {
  static var client = https.Client();

  static Future<List<ApplicantsResponseModel>?> getApplicants() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.applicants);
    try {
      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      if (response.statusCode == 200) {
        var applicantsList = applicantsResponseModelFromJson(response.body);
        return applicantsList;
      } else {
        throw Exception('Failed to get the Applicants');
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // static Future<User> getUserDetails({required String userId}) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var url = Uri.https(Config.apiUrl, '${Config.users}/$userId');
  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //   );

  //   if (response.statusCode == 200) {
  //     var user = userFromJson(response.body);
  //     return user;
  //   } else {
  //     throw Exception('Failed to load the User Details');
  //   }
  // }

  // static Future<List<JobsResponse>> searchUsers(String searchQuery) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var url = Uri.https(Config.apiUrl, '${Config.search}/$searchQuery');
  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //   );

  //   if (response.statusCode == 200) {
  //     var jobsList = jobsResponseFromJson(response.body);
  //     return jobsList;
  //   } else {
  //     throw Exception('Failed to load the Jobs');
  //   }
  // }
}
