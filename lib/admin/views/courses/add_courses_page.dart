import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/controllers/my_courses_provider.dart';
import 'package:jobs_hub/admin/models/course_req.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class AddCoursesPage extends StatefulWidget {
  const AddCoursesPage({super.key});

  @override
  State<AddCoursesPage> createState() => _AddCoursesPageState();
}

class _AddCoursesPageState extends State<AddCoursesPage> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController instructorCtrl = TextEditingController();
  TextEditingController ratingCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController availableInCtrl = TextEditingController();
  TextEditingController webAddressCrtl = TextEditingController();

  @override
  void dispose() {
    titleCtrl.dispose();
    ratingCtrl.dispose();
    instructorCtrl.dispose();
    webAddressCrtl.dispose();
    availableInCtrl.dispose();
    priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Add a Course',
          actions: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: GestureDetector(
                onTap: () {},
                child: const SizedBox.shrink(),
              ),
            )
          ],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Consumer<MyCourseNotifier>(
          builder: (context, myCourseNotifier, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Form(
              key: myCourseNotifier.formKey,
              child: Column(
                children: [
                  const HeightSpacer(size: 20),
                  const HeadingWidget(text: 'Course Details'),
                  const HeightSpacer(size: 10),
                  myCourseNotifier.imageFil.isEmpty
                      ? GestureDetector(
                          onTap: () {
                            myCourseNotifier.pickImage();
                          },
                          child: Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select a Banner for the course',
                                  style: appstyle(14, Color(kDarkGrey.value),
                                      FontWeight.w600),
                                ),
                                const Icon(Icons.image_search_outlined),
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            myCourseNotifier.imageFil.clear();
                            setState(() {});
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Course Banner',
                                style: appstyle(14, Color(kDarkGrey.value),
                                    FontWeight.w600),
                              ),
                              const HeightSpacer(size: 5),
                              Container(
                                width: width,
                                height: height * 0.24,
                                child: Image.file(
                                  File(myCourseNotifier.imageFil[0]),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                  const HeightSpacer(size: 20),
                  CustomTextFormField(
                    controller: titleCtrl,
                    label: 'Course Name',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Course Name';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: instructorCtrl,
                    label: 'Instructor Name',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter instructor name';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: ratingCtrl,
                    label: 'Rating',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter rating';
                      } else if (num.parse(value) > 5) {
                        return 'Rating can\'t be greater than 5';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: priceCtrl,
                    label: 'Price',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Job Title';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: availableInCtrl,
                    label: 'Available In',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please specify where it is avilable';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: webAddressCrtl,
                    label: 'Web Address',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the web address for the course';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 24),
                  CustomButton(
                    onTap: () async {
                      if (!myCourseNotifier.validAndSave()) {
                        Get.snackbar(
                          'Updation Failed',
                          'Please Fill the details Properly...',
                          colorText: Color(kLight.value),
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.add_alert),
                        );
                      } else if (myCourseNotifier.imageFil.isEmpty &&
                          myCourseNotifier.imageUrl == null) {
                        Get.snackbar(
                          'Company Logo Missing',
                          'Please upload an Logo to proceed',
                          colorText: Color(kLight.value),
                          backgroundColor: Color(kLightBlue.value),
                          icon: const Icon(Icons.add_alert),
                        );
                      } else {
                        myCourseNotifier.addCourse(
                            model: CourseReqModel(
                          title: titleCtrl.text,
                          instructor: instructorCtrl.text,
                          price: num.parse(priceCtrl.text),
                          rating: num.parse(ratingCtrl.text),
                          availableIn: availableInCtrl.text,
                          webAddress: webAddressCrtl.text,
                          imageUrl: myCourseNotifier.imageUrl!,
                        ));
                      }
                    },
                    text: 'Add a Course',
                  )
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
