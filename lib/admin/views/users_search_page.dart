import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/services/helpers/jobs_helper.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_tile.dart';
import 'package:jobs_hub/user/views/ui/search/widgets/custom_field.dart';

class UsersSearchPage extends StatefulWidget {
  const UsersSearchPage({super.key});

  @override
  State<UsersSearchPage> createState() => _UsersSearchPageState();
}

class _UsersSearchPageState extends State<UsersSearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(color: Color(kLight.value)),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: CustomField(
          hintText: "Search for a user",
          controller: searchController,
          onEditingComplete: () {
            setState(() {});
          },
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon((AntDesign.search1)),
          ),
        ),
      ),
      body: searchController.text.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
              child: FutureBuilder(
                  future: JobsHelper.searchJobs(searchController.text),
                  builder: (context, jobsSnapshot) {
                    if (jobsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (jobsSnapshot.hasError) {
                      return Center(
                        child: Text('Error ${jobsSnapshot.error}'),
                      );
                    } else if (jobsSnapshot.data?.isEmpty ?? true) {
                      return const EmptyStateWidget(text: "Job not Found");
                    }
                    final jobs = jobsSnapshot.data;
                    return ListView.builder(
                      itemCount: jobs!.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return VerticalTileWidget(job: job);
                      },
                    );
                  }),
            )
          : const EmptyStateWidget(text: "Start Searching for Jobs"),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  final String text;
  const EmptyStateWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/optimized_search.png"),
          ReusableText(
              text: text,
              style: appstyle(22, Color(kDark.value), FontWeight.bold)),
        ],
      ),
    );
  }
}
