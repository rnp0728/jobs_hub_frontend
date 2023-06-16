import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/request/bookmarks/bookmarks_model.dart';
import 'package:jobs_hub/user/models/response/bookmarks/all_bookmarks.dart';
import 'package:jobs_hub/user/services/helpers/bookmark_helper.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkNotifier extends ChangeNotifier {
  List<String> _jobs = [];
  List<String> get jobs => _jobs;

  Future<void> addJob(String jobId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_jobs != null) {
      _jobs.insert(0, jobId);
      prefs.setStringList('jobId', _jobs);
      notifyListeners();
    }
  }

  Future<void> removeJob(String jobId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_jobs != null) {
      _jobs.remove(jobId);
      prefs.setStringList('jobId', _jobs);
      notifyListeners();
    }
  }

  set jobs(List<String> newList) {
    _jobs = newList;
    notifyListeners();
  }

  Future<void> loadJobs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final jobs = prefs.getStringList('jobId');

    if (jobs != null) {
      _jobs = jobs;
    }
  }

  addBookmark(BookmarkReqModel model, String jobId) {
    BookMarkHelper.addBookmark(model: model).then((response) {
      if (response[0]) {
        addJob(jobId);
        Get.snackbar(
          "Bookmark Added Successfully",
          "Please check your Bookmarks",
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.bookmark_added_rounded),
        );
      } else {
        Get.snackbar(
          "Failed to add Bookmark",
          "Please try Again!",
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.bookmark_added_rounded),
        );
      }
    });
  }

  deleteBookmark(String jobId) {
    BookMarkHelper.deleteBookmark(jobId: jobId).then((response) {
      if (response) {
        removeJob(jobId);
        Get.snackbar(
          "Bookmark Removed Successfully",
          "Please check your Bookmarks",
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.bookmark_remove_outlined),
        );
      } else {
        Get.snackbar(
          "Failed to remove Bookmark",
          "Please try Again!",
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.bookmark_remove_outlined),
        );
      }
    });
  }

  late Future<List<AllBookmarks>> bookmarks;
  getBookmarks() {
    bookmarks = BookMarkHelper.getBookmarks();
  }

  //Internships BookMark

  List<String> _internships = [];
  List<String> get internships => _internships;

  Future<void> addInternship(String internshipId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_internships != null) {
      _internships.insert(0, internshipId);
      prefs.setStringList('internshipId', _internships);
      notifyListeners();
    }
  }

  Future<void> removeInternship(String internshipId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_internships != null) {
      _jobs.remove(internshipId);
      prefs.setStringList('internshipId', _internships);
      notifyListeners();
    }
  }

  set internships(List<String> newList) {
    _internships = newList;
    notifyListeners();
  }

  Future<void> loadInternships() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final internships = prefs.getStringList('internshipId');

    if (internships != null) {
      _internships = internships;
    }
  }

  addInternshipBookmark(BookmarkReqModel model, String internshipId) {
    BookMarkHelper.addInternshipBookmark(model: model).then((response) {
      if (response[0]) {
        addJob(internshipId);
        Get.snackbar(
          "Bookmark Added Successfully",
          "Please check your Bookmarks",
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.bookmark_added_rounded),
        );
      } else {
        Get.snackbar(
          "Failed to add Bookmark",
          "Please try Again!",
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.bookmark_added_rounded),
        );
      }
    });
  }

  deleteInternshipBookmark(String internshipId) {
    BookMarkHelper.deleteInternshipBookmark(internshipId: internshipId)
        .then((response) {
      if (response) {
        removeJob(internshipId);
        Get.snackbar(
          "Bookmark Removed Successfully",
          "Please check your Bookmarks",
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.bookmark_remove_outlined),
        );
      } else {
        Get.snackbar(
          "Failed to remove Bookmark",
          "Please try Again!",
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.bookmark_remove_outlined),
        );
      }
    });
  }
}
