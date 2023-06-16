import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/admin/models/users.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';

class UserTile extends StatelessWidget {
  final void Function()? onTap;
  final User user;
  const UserTile({super.key, this.onTap, required this.user});

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
        height: height * 0.13,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 1,
                child: Chip(
                    backgroundColor: Color(kOrange.value),
                    label: Text(
                      '${user.userType[0].toUpperCase()}${user.userType.substring(1)} ',
                      style: appstyle(12, Color(kDark.value), FontWeight.w500),
                    ))),
            Row(
              children: [
                Container(
                  width: width * 0.2,
                  height: height.h,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(kOrange.value)),
                      borderRadius: BorderRadius.circular(0)),
                  child: Image.network(user.profile,
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
                          text: user.username,
                          style: appstyle(
                            16,
                            Color(kDark.value),
                            FontWeight.w600,
                          ),
                        ),
                        ReusableText(
                          text: user.email,
                          style: appstyle(
                            14,
                            Color(kDark.value),
                            FontWeight.w500,
                          ),
                        ),
                        ReusableText(
                          text: user.phone,
                          style: appstyle(
                            14,
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
          ],
        ),
      ),
    );
  }
}
