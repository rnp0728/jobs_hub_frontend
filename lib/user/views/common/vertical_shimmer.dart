import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:shimmer/shimmer.dart';

class VerticalShimmer extends StatelessWidget {
  const VerticalShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(kLightGrey.value),
      highlightColor: Color(kLight.value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        width: width,
        height: height * 0.15,
        decoration: BoxDecoration(
          color: Color(kLightGrey.value),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
