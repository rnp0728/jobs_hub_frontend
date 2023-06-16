import 'package:flutter/foundation.dart';
import 'package:jobs_hub/user/models/response/courses/courses_response.dart';
import 'package:jobs_hub/user/services/helpers/courses_helper.dart';

class CoursesNotifier extends ChangeNotifier {
  late Future<List<CoursesResponse>?> coursesList;

  getCourses() {
    coursesList = CoursesHelper.getCourses();
  }
}
