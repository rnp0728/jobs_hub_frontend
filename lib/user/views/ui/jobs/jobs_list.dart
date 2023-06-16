import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_tile.dart';
import 'package:provider/provider.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var jobsNotifier = Provider.of<JobsNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'All Jobs',
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: FutureBuilder(
          future: jobsNotifier.jobsList,
          builder: (context, jobsSnapshot) {
            if (jobsSnapshot.connectionState == ConnectionState.waiting) {
              return const HorizontalShimmer();
            } else if (jobsSnapshot.hasError) {
              return Center(
                child: Text('Error ${jobsSnapshot.error}'),
              );
            }
            final jobs = jobsSnapshot.data;
            if (jobs?.isEmpty ?? true) {
              return const Center(
                child: Text('No Jobs Available Right Now'),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                itemCount: jobs?.length,
                itemBuilder: (context, index) {
                  final job = jobs![index];
                  return VerticalTileWidget(
                    job: job,
                  );
                },
              ),
            );
          }),
    );
  }
}
