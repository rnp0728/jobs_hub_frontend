import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/recruiter/models/applicants.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';

class ApplicantsTile extends StatelessWidget {
  final void Function()? onTap;
  final ApplicantsResponseModel applicant;
  const ApplicantsTile({super.key, this.onTap, required this.applicant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(kLightGrey.value),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: width,
        height: height * 0.16,
        child: Row(
          children: [
            Container(
              width: width * 0.2,
              height: height.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(kOrange.value)),
                  borderRadius: BorderRadius.circular(0)),
              child: Image.network(applicant.user.profile,
                  filterQuality: FilterQuality.high, fit: BoxFit.fill),
            ),
            const WidthSpacer(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: 'Name - ${applicant.user.username}',
                      style: appstyle(
                        14,
                        Color(kDark.value),
                        FontWeight.w600,
                      ),
                    ),
                    ReusableText(
                      text: 'Email - ${applicant.user.email}',
                      style: appstyle(
                        13,
                        Color(kDarkGrey.value),
                        FontWeight.w500,
                      ),
                    ),
                    ReusableText(
                      text: 'Phone - ${applicant.user.phone}',
                      style: appstyle(
                        13,
                        Color(kDarkGrey.value),
                        FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.share_location_outlined),
                        const WidthSpacer(width: 5),
                        ReusableText(
                          text: applicant.user.location,
                          style: appstyle(
                            13,
                            Color(kDarkGrey.value),
                            FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    if (applicant.job != null)
                      ReusableText(
                        text: 'Applied For - ${applicant.job!.title}',
                        style: appstyle(
                          13,
                          Color(kDark.value),
                          FontWeight.w500,
                        ),
                      ),
                    if (applicant.internship != null)
                      ReusableText(
                        text: 'Applied For - ${applicant.internship!.title}',
                        style: appstyle(
                          13,
                          Color(kDark.value),
                          FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
