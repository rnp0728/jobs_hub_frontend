import 'package:http/http.dart' as https;
import 'package:jobs_hub/user/models/response/internships/get_internship.dart';
import 'package:jobs_hub/user/models/response/internships/internships_response.dart';
import 'package:jobs_hub/user/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipsHelper {
  static var client = https.Client();

  static Future<List<InternshipsResponse>?> getInternships() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.internships);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var internshipsList = internshipsResponseFromJson(response.body);
      return internshipsList;
    } else {
      throw Exception('Failed to get the Internships');
    }
  }

  static Future<List<InternshipsResponse>?> getInternshipsAddedByAgent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url =
        Uri.https(Config.apiUrl, '${Config.internships}/agent-call/$userId');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var internshipsList = internshipsResponseFromJson(response.body);
      return internshipsList;
    } else {
      throw Exception('Failed to get the Internships');
    }
  }

  static Future<InternshipsResponse> getRecentInternships() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.jobs);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var internshipsList = internshipsResponseFromJson(response.body);

      var recentInternship = internshipsList.first;
      return recentInternship;
    } else {
      throw Exception('Failed to get the Internships');
    }
  }

  static Future<GetInternshipRes> getInternshipDetails(
      {required String internshipId}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, '${Config.internships}/$internshipId');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var internship = getInternshipResFromJson(response.body);
      return internship;
    } else {
      throw Exception('Failed to load the Internship Details');
    }
  }

  static Future<List<InternshipsResponse>> searchInternships(
      String searchQuery) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url =
        Uri.https(Config.apiUrl, '${Config.internshipSearch}/$searchQuery');
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var internshipsList = internshipsResponseFromJson(response.body);
      return internshipsList;
    } else {
      throw Exception('Failed to load the Internships');
    }
  }
}
