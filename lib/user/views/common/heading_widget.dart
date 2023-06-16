import 'package:flutter/material.dart';
import 'package:jobs_hub/user/views/common/exports.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  final bool showButton;
  final void Function()? onTap;
  const HeadingWidget(
      {super.key, required this.text, this.showButton = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: ReusableText(
            text: text,
            style: appstyle(19, Color(kDark.value), FontWeight.w600),
          ),
        ),
        showButton
            ? GestureDetector(
                onTap: onTap,
                child: ReusableText(
                  text: "View All",
                  style: appstyle(15, Color(kOrange.value), FontWeight.w500),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
