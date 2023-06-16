import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:jobs_hub/user/models/request/bookmarks/bookmarks_model.dart';
import 'package:jobs_hub/user/models/response/bookmarks/all_bookmarks.dart';
import 'package:jobs_hub/user/models/response/bookmarks/bookmark_response.dart';
import 'package:jobs_hub/user/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkHelper {
  static var client = https.Client();

//Add Bookmarks
  static Future<List<dynamic>> addBookmark(
      {required BookmarkReqModel model}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.bookmarkUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model));

    if (response.statusCode == 201) {
      String bookmarkId = bookmarkReqResFromJson(response.body).id;

      return [true, bookmarkId];
    } else {
      return [false];
    }
  }

  //Delete Bookmarks
  static Future<bool> deleteBookmark({required String jobId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, '${Config.bookmarkUrl}/$jobId');
    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Get Bookmarks
  static Future<List<AllBookmarks>> getBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.bookmarkUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var allBookmarks = allBookmarksFromJson(response.body);
      return allBookmarks;
    } else {
      throw Exception('Failed to load Bookmarks');
    }
  }

  //Add Bookmarks
  static Future<List<dynamic>> addInternshipBookmark(
      {required BookmarkReqModel model}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.internshipBookmarkUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model));

    if (response.statusCode == 201) {
      String bookmarkId = bookmarkReqResFromJson(response.body).id;

      return [true, bookmarkId];
    } else {
      return [false];
    }
  }

  //Delete Bookmarks
  static Future<bool> deleteInternshipBookmark(
      {required String internshipId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(
        Config.apiUrl, '${Config.internshipBookmarkUrl}/$internshipId');
    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Get Bookmarks
  static Future<List<AllBookmarks>> getInternshipBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.internshipBookmarkUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var allBookmarks = allBookmarksFromJson(response.body);
      return allBookmarks;
    } else {
      throw Exception('Failed to load Bookmarks');
    }
  }
}
