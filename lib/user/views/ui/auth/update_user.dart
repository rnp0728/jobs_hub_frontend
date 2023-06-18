import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/request/auth/profile_update_model.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/widgets/editable_string_list.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController skill0Controller = TextEditingController();
  TextEditingController skill1Controller = TextEditingController();
  TextEditingController skill2Controller = TextEditingController();
  TextEditingController skill3Controller = TextEditingController();
  TextEditingController skill4Controller = TextEditingController();

  List<String> skills = [];

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
      body: Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
        return Center(
          child: Form(
            key: loginNotifier.profileFormKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
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
                            if (!loginNotifier.profileValidation()) {
                              Get.snackbar(
                                'Updation Failed',
                                'Please Fill the details Properly...',
                                colorText: Color(kLight.value),
                                backgroundColor: Colors.red,
                                icon: const Icon(Icons.add_alert),
                              );
                            } else if (imageUploader.imageFil.isEmpty &&
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
            ),
          ),
        );
      }),
    );
  }
}
