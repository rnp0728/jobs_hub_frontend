import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/request/auth/profile_update_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/widgets/editable_string_list.dart';
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

  List<String> skills = [];

  @override
  void initState() {
    skills = profile;
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    locationController.dispose();
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
                    const HeightSpacer(size: 10),
                    EditableStringList(
                      label: 'Skills',
                      stringList: skills,
                      updateListInState: (list) {
                        for (var element in list) {
                          if (!skills.contains(element)) {
                            requirements.add(element);
                          }
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add some skills';
                        }
                        return null;
                      },
                      saveValidator: (value) => null,
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
                                  skills: skills);

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
