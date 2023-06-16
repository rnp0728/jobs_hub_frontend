import 'package:flutter/material.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:jobs_hub/user/views/common/app_style.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            const HeightSpacer(size: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/page2.png"),
            ),
            const HeightSpacer(size: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Stable Yourself \n With Your Ability',
                  textAlign: TextAlign.center,
                  style: appstyle(30, Color(kLight.value), FontWeight.w500),
                ),
                const HeightSpacer(size: 10),
                Text(
                  'We help you to find your dream JOB according to your skills',
                  textAlign: TextAlign.center,
                  style: appstyle(14, Color(kLight.value), FontWeight.normal),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
