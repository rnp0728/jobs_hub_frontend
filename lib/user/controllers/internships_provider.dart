import 'package:flutter/foundation.dart';
import 'package:jobs_hub/user/models/response/internships/get_internship.dart';
import 'package:jobs_hub/user/models/response/internships/internships_response.dart';
import 'package:jobs_hub/user/services/helpers/internships_helper.dart';

class InternshipsNotifier extends ChangeNotifier {
  late Future<List<InternshipsResponse>?> internshipsList;

  getInternships() {
    internshipsList = InternshipsHelper.getInternships();
  }

  late Future<InternshipsResponse> recentJob;

  getRecentInternships() {
    recentJob = InternshipsHelper.getRecentInternships();
  }

  late Future<GetInternshipRes> internship;

  getInternshipDetails(String internshipId) {
    internship =
        InternshipsHelper.getInternshipDetails(internshipId: internshipId);
  }

  late Future<List<InternshipsResponse>?> agentInternshipsList;
  getInternshipsAddedByAgent() {
    agentInternshipsList = InternshipsHelper.getInternshipsAddedByAgent();
  }
}
