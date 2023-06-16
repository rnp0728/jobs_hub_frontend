import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/response/internships/internships_response.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_page.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';

class VerticalTileWidget extends StatelessWidget {
  final InternshipsResponse internship;
  const VerticalTileWidget({super.key, required this.internship});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          Get.to(
              () => InternshipPage(title: internship.title, id: internship.id));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          height: height * 0.15,
          width: width,
          color: Color(kLightGrey.value),
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
                            text: internship.company,
                            style: appstyle(
                                20, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: internship.title,
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
                      Get.to(() =>
                          JobPage(title: internship.title, id: internship.id));
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
                        text: internship.stipend,
                        style:
                            appstyle(18, Color(kDark.value), FontWeight.w600),
                      ),
                      ReusableText(
                        text: '/${internship.period}',
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
