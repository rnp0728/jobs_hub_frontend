import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/user/views/common/app_style.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  final Widget child;
  final List<Widget>? actions;
  const CustomAppBar({super.key, this.text, required this.child, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      backgroundColor: Color(kLight.value),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
          text: text ?? '',
          style: appstyle(16, Color(kDark.value), FontWeight.w600)),
    );
  }
}
