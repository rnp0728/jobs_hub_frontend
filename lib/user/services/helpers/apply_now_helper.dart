import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:jobs_hub/user/services/config.dart';

class ApplyNowHelper {
  static var client = https.Client();

  static Future<bool> applyNow({
    required String? job,
    required String? internship,
    required String user,
    required String agentId,
  }) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.https(Config.apiUrl, Config.applicants);
    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          'job': job,
          'internship': internship,
          'user': user,
          'agentId': agentId
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
