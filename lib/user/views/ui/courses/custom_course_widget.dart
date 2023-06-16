import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';

class CourseWidget extends StatelessWidget {
  final String title;
  final String instructor;
  final double rating;
  final num price;
  final String imageUrl;
  final String availableIn;
  final void Function()? onTap;

  const CourseWidget(
      {Key? key,
      required this.title,
      required this.instructor,
      required this.rating,
      required this.price,
      required this.imageUrl,
      required this.availableIn,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.w),
        height: height * 0.34,
        width: width * 0.6,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.15,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 204, 194, 7))),
                child: Image.network(imageUrl,
                    filterQuality: FilterQuality.high, fit: BoxFit.fill),
              ),
              const HeightSpacer(size: 4),
              ReusableText(
                text: title,
                style: appstyle(18, Colors.black, FontWeight.w600),
              ),
              const HeightSpacer(size: 4),
              Text(
                instructor,
                style: appstyle(12, Colors.black, FontWeight.w400),
              ),
              const HeightSpacer(size: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    rating.toString(),
                    style: appstyle(14, Color(kDark.value), FontWeight.w500),
                  ),
                  const WidthSpacer(width: 4),
                  RatingBar.builder(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    tapOnlyMode: true,
                    wrapAlignment: WrapAlignment.start,
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              const HeightSpacer(size: 4),
              ReusableText(
                text: '${price.toString()} INR',
                style: appstyle(16, Colors.black, FontWeight.w600),
              ),
              const HeightSpacer(size: 4),
              ReusableText(
                text: 'Avaiable in $availableIn',
                style: appstyle(12, Colors.black, FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
