import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/response/bookmarks/all_bookmarks.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';

class BookmarkTileWidget extends StatelessWidget {
  final AllBookmarks bookmark;
  const BookmarkTileWidget({super.key, required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, right: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(() => JobPage(title: bookmark.job.title, id: bookmark.job.id));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(kLightGrey.value),
          ),
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
                            text: bookmark.job.company,
                            style: appstyle(
                                20, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: bookmark.job.title,
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
                      Get.to(() => JobPage(
                          title: bookmark.job.title, id: bookmark.job.id));
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
                        text: bookmark.job.salary,
                        style:
                            appstyle(18, Color(kDark.value), FontWeight.w600),
                      ),
                      ReusableText(
                        text: '/${bookmark.job.period}',
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
