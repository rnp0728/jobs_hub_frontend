import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/views/common/custom_outline_btn.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:jobs_hub/user/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            const HeightSpacer(size: 20),
            ReusableText(
                text: 'Welcome to Jobs Hub',
                style: appstyle(30, Color(kLight.value), FontWeight.w600)),
            const HeightSpacer(size: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Text(
                'We help you to find your dream JOB according to your skills',
                textAlign: TextAlign.center,
                style: appstyle(14, Color(kLight.value), FontWeight.normal),
              ),
            ),
            const HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineBtn(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entrypoint', true);
                    Get.to(() => const LoginPage());
                  },
                  text: "Login",
                  width: width * 0.4,
                  height: height * 0.06,
                  primaryColor: Color(kLight.value),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegistrationPage());
                  },
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    color: Color(kLight.value),
                    child: Center(
                        child: ReusableText(
                      text: 'Sign Up',
                      style: appstyle(
                          16, Color(kLightBlue.value), FontWeight.w600),
                    )),
                  ),
                )
              ],
            ),
            const HeightSpacer(size: 30),
            ReusableText(
                text: 'Continue as guest',
                style: appstyle(16, Color(kLight.value), FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
