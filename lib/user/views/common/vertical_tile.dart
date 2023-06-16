import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/response/jobs/jobs_response.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';

class VerticalTile extends StatelessWidget {
  final void Function()? onTap;
  final JobsResponse job;
  const VerticalTile({super.key, this.onTap, required this.job});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(kLightGrey.value),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: height * 0.15,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(kLightGrey.value),
                      radius: 30,
                      backgroundImage:
                          const AssetImage("assets/images/slack.png"),
                    ),
                    const WidthSpacer(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: job.company,
                          style:
                              appstyle(18, Color(kDark.value), FontWeight.w600),
                        ),
                        SizedBox(
                          width: width * 0.5,
                          child: ReusableText(
                            text: job.title,
                            style: appstyle(
                                16, Color(kDarkGrey.value), FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                  ReusableText(
                    text: job.salary,
                    style: appstyle(18, Color(kDark.value), FontWeight.w600),
                  ),
                  const WidthSpacer(width: 5),
                  ReusableText(
                    text: '/${job.period}',
                    style:
                        appstyle(18, Color(kDarkGrey.value), FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.to(
                              () => JobPage(
                                id: job.id,
                                title: job.company,
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Text('View Details',
                                  style: TextStyle(color: Colors.cyan)),
                              Icon(Ionicons.chevron_forward, color: Colors.cyan)
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
