import 'package:flutter/material.dart';
import 'package:jobs_hub/user/views/common/app_style.dart';
import 'package:jobs_hub/user/views/common/reusable_text.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      this.width,
      this.height,
      required this.text,
      required this.primaryColor,
      this.secondaryColor,
      this.onTap});
  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  final Color primaryColor;
  final Color? secondaryColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(width: 1, color: primaryColor),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(16, primaryColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
