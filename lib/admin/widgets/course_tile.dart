import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/user/models/response/courses/courses_response.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';

class CourseTile extends StatelessWidget {
  final CoursesResponse course;
  final void Function()? onTap;

  const CourseTile({Key? key, required this.course, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height * 0.16,
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height.h,
                width: width * 0.34,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(course.imageUrl,
                    filterQuality: FilterQuality.high, fit: BoxFit.fill),
              ),
              const WidthSpacer(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: appstyle(16, Colors.black, FontWeight.w600),
                    ),
                    const HeightSpacer(size: 4),
                    Text(
                      course.instructor,
                      style: appstyle(12, Colors.black, FontWeight.w400),
                    ),
                    const HeightSpacer(size: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          course.rating.toString(),
                          style:
                              appstyle(12, Color(kDark.value), FontWeight.w500),
                        ),
                        const WidthSpacer(width: 4),
                        RatingBar.builder(
                          initialRating: double.parse(course.rating.toString()),
                          direction: Axis.horizontal,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 18,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
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
                      text: '${course.price.toString()} INR',
                      style: appstyle(14, Colors.black, FontWeight.w600),
                    ),
                    const HeightSpacer(size: 4),
                    ReusableText(
                      text: 'Avaiable in ${course.availableIn}',
                      style: appstyle(12, Colors.black, FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
