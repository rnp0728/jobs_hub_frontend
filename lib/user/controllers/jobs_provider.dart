import 'package:flutter/foundation.dart';
import 'package:jobs_hub/user/models/response/jobs/get_job.dart';
import 'package:jobs_hub/user/models/response/jobs/jobs_response.dart';
import 'package:jobs_hub/user/services/helpers/jobs_helper.dart';

class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>?> jobsList;

  getJobs() {
    jobsList = JobsHelper.getJobs();
  }

  late Future<JobsResponse> recentJob;

  getRecentJobs() {
    recentJob = JobsHelper.getRecentJobs();
  }

  late Future<GetJobRes> job;

  getJobDetails(String jobId) {
    job = JobsHelper.getJobDetails(jobId: jobId);
  }

  late Future<List<JobsResponse>?> agentJobsList;

  getJobsAddedByAgent() {
    agentJobsList = JobsHelper.getJobsAddedByAgent();
  }
}
