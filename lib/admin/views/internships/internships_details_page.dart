import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/controllers/internships_provider.dart';
import 'package:jobs_hub/user/models/request/bookmarks/bookmarks_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_outline_btn.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/apply_now/internship_apply_now_form_page.dart';
import 'package:provider/provider.dart';

class InternshipDetailsPage extends StatefulWidget {
  final String title;
  final String id;
  const InternshipDetailsPage(
      {super.key, required this.title, required this.id});

  @override
  State<InternshipDetailsPage> createState() => _InternshipDetailsPageState();
}

class _InternshipDetailsPageState extends State<InternshipDetailsPage> {
  String bullet = "\u2022";
  @override
  Widget build(BuildContext context) {
    return Consumer<InternshipsNotifier>(
        builder: (context, internshipsNotifier, child) {
      internshipsNotifier.getInternshipDetails(widget.id);
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: CustomAppBar(
              text: widget.title,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          body: FutureBuilder(
              future: internshipsNotifier.internship,
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
                final internship = snapshot.data;
                if (internship == null) {
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
                          const HeightSpacer(size: 30),
                          Container(
                            width: width,
                            height: height * 0.27,
                            color: Color(kLightGrey.value),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(internship.imageUrl),
                                ),
                                const HeightSpacer(size: 10),
                                ReusableText(
                                  text: internship.title,
                                  style: appstyle(
                                      22, Color(kDark.value), FontWeight.w600),
                                ),
                                const HeightSpacer(size: 5),
                                ReusableText(
                                  text: internship.location,
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
                                        text: internship.contract,
                                        primaryColor: Color(kOrange.value),
                                      ),
                                      // const WidthSpacer(width: 20),
                                      Row(
                                        children: [
                                          ReusableText(
                                            text: internship.stipend,
                                            style: appstyle(
                                                18,
                                                Color(kDark.value),
                                                FontWeight.w600),
                                          ),
                                          ReusableText(
                                            text: '/${internship.period}',
                                            style: appstyle(
                                                18,
                                                Color(kDark.value),
                                                FontWeight.w600),
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
                            text: 'Internship Description',
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
                            text: "Requirements & Responsibilities",
                            style: appstyle(
                                16, Color(kDarkGrey.value), FontWeight.normal),
                          ),
                          const HeightSpacer(size: 10),
                          SizedBox(
                            height: height * 0.5,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: internship.requirements.length,
                              itemBuilder: (context, index) {
                                final req = internship.requirements[index];
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
                                    i < internship.requirements.length;
                                    i++)
                                  Chip(
                                    backgroundColor: Colors.cyan[50],
                                    side: const BorderSide(
                                        color: Colors.cyan, width: 1),
                                    label: Text(
                                        "$bullet ${internship.requirements[i]}"),
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
                              Get.to(() => InternshipsApplyNowFormPage(
                                    internship: internship,
                                  ));
                            },
                            text: 'Apply Now',
                            width: width,
                            height: height * 0.06,
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
