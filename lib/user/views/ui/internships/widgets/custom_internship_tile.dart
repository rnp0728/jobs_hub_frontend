import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/response/internships/internships_response.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_page.dart';

class CustomInternshipTile extends StatelessWidget {
  final void Function()? onTap;
  final InternshipsResponse internship;
  const CustomInternshipTile({super.key, this.onTap, required this.internship});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(kLightGrey.value),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        width: width,
        height: height * 0.25,
        child: Stack(
          children: [
            const Positioned(
                top: 5, right: 10, child: Chip(label: Text('Internship'))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Facebook.png'),
                    ),
                    const WidthSpacer(width: 12),
                    ReusableText(
                      text: internship.company,
                      style: appstyle(
                        18,
                        Color(kDark.value),
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const HeightSpacer(size: 12),
                ReusableText(
                  text: internship.title,
                  style: appstyle(
                    18,
                    Color(kDark.value),
                    FontWeight.w600,
                  ),
                ),
                ReusableText(
                  text: internship.location,
                  style: appstyle(
                    15,
                    Color(kDarkGrey.value),
                    FontWeight.w600,
                  ),
                ),
                const HeightSpacer(size: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ReusableText(
                          text: internship.stipend,
                          style: appstyle(
                            16,
                            Color(kDark.value),
                            FontWeight.w600,
                          ),
                        ),
                        ReusableText(
                          text: '/${internship.period}',
                          style: appstyle(
                            16,
                            Color(kDarkGrey.value),
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(
                                () => InternshipPage(
                                  id: internship.id,
                                  title: internship.company,
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                Text('View Details',
                                    style: TextStyle(color: Colors.cyan)),
                                Icon(Ionicons.chevron_forward,
                                    color: Colors.cyan)
                              ],
                            ))
                      ],
                    )
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
