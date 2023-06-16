import 'package:flutter/material.dart';
import 'package:jobs_hub/recruiter/models/applicants.dart';
import 'package:jobs_hub/recruiter/services/applicants_helper.dart';

class ApplicantsNotifier extends ChangeNotifier {
  late Future<List<ApplicantsResponseModel>?> applicantsList;

  getApplicants() {
    applicantsList = ApplicantsHelper.getApplicants();
  }
}
