import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/response/auth/profile_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/update_profile.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Profile",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body:
          Consumer<ProfileNotifier>(builder: (context, profileNotifier, child) {
        profileNotifier.getProfile();
        return FutureBuilder<ProfileRes>(
            future: profileNotifier.profile,
            builder: (context, profileSnapshot) {
              if (profileSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (profileSnapshot.hasError) {
                return Center(
                    child: Text('Error Occurred ${profileSnapshot.error}'));
              }
              final userData = profileSnapshot.data;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.12,
                      color: Color(kLight.value),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: CachedNetworkImage(
                                    width: 80.w,
                                    imageUrl: userData?.profile ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlwgT43LjLiOsOKgrNiDwHJH4jupqqgMvw1OfGpe8UcUlZF-AQLt_L0HauH6XE4-ZlEyvkxFKQF5U&usqp=CAU&ec=48665699'),
                              ),
                              const WidthSpacer(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userData!.username,
                                    softWrap: true,
                                    style: appstyle(
                                      20,
                                      Color(kDark.value),
                                      FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        MaterialIcons.location_pin,
                                        color: Color(kDarkGrey.value),
                                      ),
                                      const WidthSpacer(width: 5),
                                      ReusableText(
                                        text: userData.location ?? '',
                                        style: appstyle(
                                            16,
                                            Color(kDarkGrey.value),
                                            FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              profile = userData.skills ?? [];
                              Get.to(() => const UpdateProfile());
                            },
                            child: const Icon(
                              Feather.edit,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    const HeightSpacer(size: 20),
                    Stack(
                      children: [
                        Container(
                          color: Color(kLightGrey.value),
                          width: width,
                          height: height * 0.12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 12.w),
                                width: 60.w,
                                height: 70.h,
                                color: Color(kLight.value),
                                child: const Icon(
                                  FontAwesome5Regular.file_pdf,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ReusableText(
                                    text: 'Resume from Jobs Hub',
                                    style: appstyle(18, Color(kDark.value),
                                        FontWeight.w500),
                                  ),
                                  ReusableText(
                                    text: 'Jobs Hub Resume',
                                    style: appstyle(16, Color(kDarkGrey.value),
                                        FontWeight.w500),
                                  ),
                                ],
                              ),
                              const WidthSpacer(width: 1)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 2.h,
                          right: 5.w,
                          child: GestureDetector(
                            onTap: () {},
                            child: ReusableText(
                              text: 'Edit',
                              style: appstyle(
                                  16, Color(kOrange.value), FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                    const HeightSpacer(size: 20),
                    Container(
                      padding: EdgeInsets.only(left: 8.w),
                      width: width,
                      height: height * 0.06,
                      color: Color(kLightGrey.value),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ReusableText(
                          text: userData.email,
                          style:
                              appstyle(16, Color(kDark.value), FontWeight.w600),
                        ),
                      ),
                    ),
                    const HeightSpacer(size: 20),
                    Container(
                      padding: EdgeInsets.only(left: 8.w),
                      width: width,
                      height: height * 0.06,
                      color: Color(kLightGrey.value),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/usa.svg",
                              width: 20.w,
                              height: 20.h,
                            ),
                            const WidthSpacer(width: 15),
                            ReusableText(
                              text: userData.phone ?? '',
                              style: appstyle(
                                  16, Color(kDark.value), FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const HeightSpacer(size: 15),
                    Container(
                      color: Color(kLightGrey.value),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ReusableText(
                              text: 'Skills',
                              style: appstyle(
                                  16, Color(kDark.value), FontWeight.w600),
                            ),
                          ),
                          const HeightSpacer(size: 3),
                          SizedBox(
                            height: height * 0.5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              child: ListView.builder(
                                itemCount: userData.skills?.length ?? 0,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final skill = userData.skills?[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      width: width,
                                      height: height * 0.06,
                                      color: Color(kLight.value),
                                      child: ReusableText(
                                        text: skill ?? '',
                                        style: appstyle(16, Color(kDark.value),
                                            FontWeight.normal),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}
