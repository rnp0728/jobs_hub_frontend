import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/common_provider.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmNewPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    currentPasswordCtrl.dispose();
    newPasswordCtrl.dispose();
    confirmNewPasswordCtrl.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var profileNotifier = Provider.of<ProfileNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Update Password',
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Consumer<CommonNotifier>(builder: (context, notifier, child) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Container(
            height: height.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  FutureBuilder(
                      future: profileNotifier.profile,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox.shrink();
                        }
                        var profile = snapshot.data;
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 20.w),
                          child: Column(
                            children: [
                              ReusableText(
                                  text: 'Hi ${profile?.username ?? ''},',
                                  style: appstyle(
                                      20, Color(kDark.value), FontWeight.bold)),
                              Text('Fill the Details Accordingly',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: appstyle(
                                      20, Color(kDark.value), FontWeight.bold)),
                            ],
                          ),
                        );
                      }),
                  CustomTextField(
                    controller: currentPasswordCtrl,
                    hintText: 'Current Password',
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: newPasswordCtrl,
                    hintText: 'New Password',
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (password == null || password == '') {
                        return 'Please Enter the new Password';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: confirmNewPasswordCtrl,
                    hintText: 'Confirm New Password',
                    keyboardType: TextInputType.text,
                    validator: (password) {
                      if (password == null || password == '') {
                        return 'Please Enter the new Password';
                      } else if (newPasswordCtrl.text != password) {
                        return 'Passwords didn\'t Match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'Update Password',
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      notifier.updatePassword(
                        currentPassword: currentPasswordCtrl.text,
                        newPassword: newPasswordCtrl.text,
                      );
                    },
                  ),
                  const HeightSpacer(size: 20),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
