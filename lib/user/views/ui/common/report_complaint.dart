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

class ReportAComplaint extends StatefulWidget {
  const ReportAComplaint({super.key});

  @override
  State<ReportAComplaint> createState() => _ReportAComplaintState();
}

class _ReportAComplaintState extends State<ReportAComplaint> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController complaintController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    complaintController.dispose();
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
          text: 'Report A Complaint',
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
                              ReusableText(
                                  text: 'we are here to help you!',
                                  style: appstyle(
                                      20, Color(kDark.value), FontWeight.bold)),
                            ],
                          ),
                        );
                      }),
                  CustomTextField(
                    controller: subjectController,
                    hintText: 'Subject',
                    keyboardType: TextInputType.text,
                    validator: (subject) {
                      if (subject == null || subject.isEmpty) {
                        return 'Please give a subject to your complaint';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: complaintController,
                    hintText: 'Type your complaint here',
                    maxLines: 10,
                    keyboardType: TextInputType.text,
                    validator: (complaint) {
                      if (complaint == null || complaint == '') {
                        return 'Write about your complaint';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  CustomButton(
                    text: 'Submit',
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      notifier.sendEmail(
                          subject: subjectController.text,
                          content: complaintController.text,
                          reciever: 'rnp0728@gmail.com');
                      Get.back();
                    },
                  ),
                  const HeightSpacer(size: 20),
                  Text(
                      'We will get back to you within 24 hours.\nThank you for your patience.',
                      textAlign: TextAlign.center,
                      style: appstyle(15, Color(kDark.value), FontWeight.bold)),
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
