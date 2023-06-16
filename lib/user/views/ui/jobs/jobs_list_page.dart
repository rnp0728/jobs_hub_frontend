import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/search.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/custom_tile.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_search_widget.dart';
import 'package:jobs_hub/user/views/ui/search/searchpage.dart';
import 'package:provider/provider.dart';

class JobsListPage extends StatelessWidget {
  const JobsListPage({super.key});

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
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: JobsSearchWidget(
                    onTap: () {
                      Get.to(() => const SearchPage());
                    },
                  ),
                ),
                const HeightSpacer(size: 10),
                FutureBuilder(
                    future: jobsNotifier.jobsList,
                    builder: (context, jobsSnapshot) {
                      if (jobsSnapshot.connectionState ==
                          ConnectionState.waiting) {
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
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: jobs?.length,
                        itemBuilder: (context, index) {
                          final job = jobs![index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: CustomTile(
                              onTap: () {
                                Get.to(
                                  () => JobPage(
                                    id: job.id,
                                    title: job.company,
                                  ),
                                );
                              },
                              job: job,
                            ),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
