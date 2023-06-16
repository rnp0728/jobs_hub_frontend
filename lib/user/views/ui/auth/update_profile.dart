import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/request/auth/profile_update_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/app_style.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/reusable_text.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({
    super.key,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController skill0Controller =
      TextEditingController(text: profile[0]);
  TextEditingController skill1Controller =
      TextEditingController(text: profile[1]);
  TextEditingController skill2Controller =
      TextEditingController(text: profile[2]);
  TextEditingController skill3Controller =
      TextEditingController(text: profile[3]);
  TextEditingController skill4Controller =
      TextEditingController(text: profile[4]);

  @override
  void dispose() {
    phoneController.dispose();
    locationController.dispose();
    skill0Controller.dispose();
    skill1Controller.dispose();
    skill2Controller.dispose();
    skill3Controller.dispose();
    skill4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
              text: 'Update Profile',
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_rounded),
              )),
        ),
        body: Consumer<LoginNotifier>(
          builder: (context, loginNotifier, child) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Personal Details',
                      style: appstyle(35, Color(kDark.value), FontWeight.bold),
                    ),
                    Consumer<ImageUploader>(
                        builder: (context, imageUploader, child) {
                      return imageUploader.imageFil.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                imageUploader.pickImage();
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(kLightBlue.value),
                                // backgroundImage: ,
                                child: const Icon(Icons.photo_filter_rounded),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                imageUploader.imageFil.clear();
                                setState(() {});
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(kLightBlue.value),
                                backgroundImage: FileImage(
                                  File(imageUploader.imageFil[0]),
                                ),
                              ),
                            );
                    })
                  ],
                ),
                const HeightSpacer(size: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: locationController,
                      hintText: 'Location',
                      keyboardType: TextInputType.text,
                      validator: (location) {
                        if (location!.isEmpty) {
                          return 'Please enter a valid Location';
                        }
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'Please enter a valid Phone Number';
                        }
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    ReusableText(
                      text: 'Professional Details',
                      style: appstyle(35, Color(kDark.value), FontWeight.bold),
                    ),
                    CustomTextField(
                      controller: skill0Controller,
                      hintText: 'Professional Skills',
                      keyboardType: TextInputType.text,
                      validator: (skill) {
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill1Controller,
                      hintText: 'Professional Skills',
                      keyboardType: TextInputType.text,
                      validator: (skill) {
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill2Controller,
                      hintText: 'Professional Skills',
                      keyboardType: TextInputType.text,
                      validator: (skill) {
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill3Controller,
                      hintText: 'Professional Skills',
                      keyboardType: TextInputType.text,
                      validator: (skill) {
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill4Controller,
                      hintText: 'Professional Skills',
                      keyboardType: TextInputType.text,
                      validator: (skill) {
                        return null;
                      },
                    ),
                    const HeightSpacer(size: 20),
                    Consumer<ImageUploader>(
                      builder: (context, imageUploader, child) {
                        return CustomButton(
                          onTap: () {
                            if (imageUploader.imageFil.isEmpty &&
                                imageUploader.imageUrl == null) {
                              Get.snackbar(
                                'Image Missing',
                                'Please upload an Image to proceed',
                                colorText: Color(kLight.value),
                                backgroundColor: Color(kLightBlue.value),
                                icon: const Icon(Icons.add_alert),
                              );
                            } else {
                              ProfileUpdateReq model = ProfileUpdateReq(
                                  location: locationController.text,
                                  phone: phoneController.text,
                                  profile: imageUploader.imageUrl.toString(),
                                  skills: [
                                    skill0Controller.text,
                                    skill1Controller.text,
                                    skill2Controller.text,
                                    skill3Controller.text,
                                    skill4Controller.text,
                                  ]);

                              loginNotifier.updateProfile(model);
                            }
                          },
                          text: 'Update Profile',
                        );
                      },
                    ),
                  ],
                )
              ],
            );
          },
        ));
  }
}
