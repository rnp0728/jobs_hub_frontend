import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/jobshub-logo.png',
                ),
              ),
              RichText(
                text: TextSpan(
                    style: appstyle(20, Color(kOrange.value), FontWeight.w600),
                    children: [
                      TextSpan(
                          text: 'Jobs',
                          style: appstyle(
                              20, Color(kOrange.value), FontWeight.w600)),
                      TextSpan(
                          text: 'Hub',
                          style: appstyle(
                              20, Color(kDarkBlue.value), FontWeight.w600)),
                    ]),
              ),
              ReusableText(
                  text: 'Version 1.1.1',
                  style:
                      appstyle(12, Color(kDarkPurple.value), FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright_outlined,
                    size: 20,
                    color: Color(kDarkPurple.value),
                  ),
                  const WidthSpacer(width: 3),
                  ReusableText(
                      text: 'Copyright 2023 JobsHub',
                      style: appstyle(
                          12, Color(kDarkPurple.value), FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
