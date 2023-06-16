import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/controllers/internships_provider.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_page.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/custom_internship_tile.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/internship_search_widget.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/custom_tile.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:jobs_hub/user/views/ui/search/searchpage.dart';
import 'package:provider/provider.dart';

class InternshipsListPage extends StatelessWidget {
  const InternshipsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var internshipsNotifier = Provider.of<InternshipsNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'All Internships',
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
                  child: InternshipSearchWidget(
                    onTap: () {
                      Get.to(() => const SearchPage());
                    },
                  ),
                ),
                const HeightSpacer(size: 10),
                FutureBuilder(
                    future: internshipsNotifier.internshipsList,
                    builder: (context, internshipsSnapshot) {
                      if (internshipsSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const HorizontalShimmer();
                      } else if (internshipsSnapshot.hasError) {
                        return Center(
                          child: Text('Error ${internshipsSnapshot.error}'),
                        );
                      }
                      final internships = internshipsSnapshot.data;
                      if (internships?.isEmpty ?? true) {
                        return const Center(
                          child: Text('No Jobs Available Right Now'),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: internships?.length,
                        itemBuilder: (context, index) {
                          final internship = internships![index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: CustomInternshipTile(
                              onTap: () {
                                Get.to(
                                  () => InternshipPage(
                                    id: internship.id,
                                    title: internship.company,
                                  ),
                                );
                              },
                              internship: internship,
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
