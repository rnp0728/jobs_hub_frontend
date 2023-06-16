import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/request/bookmarks/bookmarks_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_outline_btn.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/apply_now/job_apply_now_form_page.dart';
import 'package:provider/provider.dart';

class JobDetailsPage extends StatefulWidget {
  final String title;
  final String id;
  const JobDetailsPage({super.key, required this.title, required this.id});

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  String bullet = "\u2022";
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(builder: (context, jobsNotifier, child) {
      jobsNotifier.getJobDetails(widget.id);
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: CustomAppBar(
              text: widget.title,
              actions: [
                Consumer<BookMarkNotifier>(
                    builder: (context, bookMarkNotifier, child) {
                  bookMarkNotifier.loadJobs();
                  return GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Icon(Icons.edit_note_outlined),
                    ),
                  );
                })
              ],
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          body: FutureBuilder(
              future: jobsNotifier.job,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error ${snapshot.error}'),
                  );
                }
                final job = snapshot.data;
                if (job == null) {
                  return const Center(
                    child: Text('Unable to Reload'),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const HeightSpacer(size: 15),
                          Container(
                            width: width,
                            height: height * 0.27,
                            color: Color(kLightGrey.value),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/user.png"),
                                ),
                                const HeightSpacer(size: 10),
                                ReusableText(
                                  text: job.title,
                                  style: appstyle(
                                      22, Color(kDark.value), FontWeight.w600),
                                ),
                                const HeightSpacer(size: 5),
                                ReusableText(
                                  text: job.location,
                                  style: appstyle(16, Color(kDarkGrey.value),
                                      FontWeight.normal),
                                ),
                                const HeightSpacer(size: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomOutlineBtn(
                                        height: height * 0.04,
                                        width: width * 0.26,
                                        secondaryColor: Color(kLight.value),
                                        text: job.contract,
                                        primaryColor: Color(kOrange.value),
                                      ),
                                      Row(
                                        children: [
                                          ReusableText(
                                            text: job.salary,
                                            style: appstyle(
                                                18,
                                                Color(kDark.value),
                                                FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: width * 0.1,
                                            child: ReusableText(
                                              text: job.period,
                                              style: appstyle(
                                                  18,
                                                  Color(kDark.value),
                                                  FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const HeightSpacer(size: 20),
                          ReusableText(
                            text: 'Job Description',
                            style: appstyle(
                                22, Color(kDark.value), FontWeight.w600),
                          ),
                          const HeightSpacer(size: 10),
                          Text(
                            desc,
                            maxLines: 8,
                            textAlign: TextAlign.justify,
                            style: appstyle(
                                16, Color(kDarkGrey.value), FontWeight.normal),
                          ),
                          const HeightSpacer(size: 20),
                          ReusableText(
                            text: "Requirements & Responsibilties",
                            style: appstyle(
                                16, Color(kDark.value), FontWeight.w500),
                          ),
                          const HeightSpacer(size: 10),
                          SizedBox(
                            height: height * 0.5,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: job.requirements.length,
                              itemBuilder: (context, index) {
                                final req = job.requirements[index];
                                String bullet = "\u2022";
                                return Text(
                                  "$bullet $req\n",
                                  maxLines: 4,
                                  textAlign: TextAlign.justify,
                                  style: appstyle(16, Color(kDarkGrey.value),
                                      FontWeight.normal),
                                );
                              },
                            ),
                          ),
                          const HeightSpacer(size: 20),
                          ReusableText(
                            text: "Key Skills Required",
                            style: appstyle(
                                16, Color(kDark.value), FontWeight.w500),
                          ),
                          const HeightSpacer(size: 10),
                          SizedBox(
                            height: height * 0.3,
                            child: Wrap(
                              runSpacing: 5,
                              spacing: 10,
                              children: [
                                for (int i = 0;
                                    i < job.skillsRequired.length;
                                    i++)
                                  Chip(
                                    backgroundColor: Colors.cyan[50],
                                    side: const BorderSide(
                                        color: Colors.cyan, width: 1),
                                    label: Text(
                                        "$bullet ${job.skillsRequired[i]}"),
                                  )
                              ],
                            ),
                          ),
                          const HeightSpacer(size: 20),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: CustomOutlineBtn(
                            onTap: () {
                              Get.to(() => JobsApplyNowFormPage(
                                    job: job,
                                  ));
                            },
                            text: 'Edit Details',
                            width: width,
                            height: height * 0.05,
                            primaryColor: Color(kLight.value),
                            secondaryColor: Color(kOrange.value),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }));
    });
  }
}
