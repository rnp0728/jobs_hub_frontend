import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/device_mgt/widgets/device_info.dart';
import 'package:jobs_hub/user/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);

    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Device Management",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacer(size: 50),
                  Text(
                    "You are logged in into your account on this Device",
                    style: appstyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  const HeightSpacer(size: 50),
                  DeviceInfo(
                    platform: 'Android',
                    location: 'Bhubaneswar, Odisha, India',
                    device: 'Redmi K20 Pro',
                    ipAddress: '198.128.155.155',
                    date: date,
                  ),
                  // const HeightSpacer(size: 50),
                  // DeviceInfo(
                  //   platform: 'Mobile App',
                  //   location: 'Odisha, India',
                  //   device: 'iPhone 14 Pro Max',
                  //   ipAddress: '254.133.155.10',
                  //   date: date,
                  // ),
                ],
              ),
            ),
            Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
              return Padding(
                padding: EdgeInsets.all(12.0.h),
                child: GestureDetector(
                  onTap: () {
                    zoomNotifier.currentIndex = 0;
                    onBoardNotifier.isLastPage = false;
                    Get.to(() => const OnBoardingScreen());
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ReusableText(
                        text: 'Sign Out of all Devices',
                        style: appstyle(
                            16, Color(kOrange.value), FontWeight.w600)),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
