import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/response/jobs/jobs_response.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';

class VerticalTileWidget extends StatelessWidget {
  final JobsResponse job;
  const VerticalTileWidget({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          Get.to(() => JobPage(title: job.title, id: job.id));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(kLightGrey.value),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          height: height * 0.15,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      const WidthSpacer(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: job.company,
                            style: appstyle(
                                20, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: job.title,
                              style: appstyle(
                                  20, Color(kDarkGrey.value), FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => JobPage(title: job.title, id: job.id));
                    },
                    child: CircleAvatar(
                      radius: 18,
                      child: Icon(
                        Ionicons.chevron_forward,
                        color: Color(kOrange.value),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 65.w),
                  child: Row(
                    children: [
                      ReusableText(
                        text: job.salary,
                        style:
                            appstyle(18, Color(kDark.value), FontWeight.w600),
                      ),
                      ReusableText(
                        text: '/${job.period}',
                        style: appstyle(
                            16, Color(kDarkGrey.value), FontWeight.w600),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
