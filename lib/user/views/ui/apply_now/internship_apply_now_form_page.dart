import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/common_provider.dart';
import 'package:jobs_hub/user/models/response/internships/get_internship.dart';
import 'package:jobs_hub/user/models/response/jobs/get_job.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipsApplyNowFormPage extends StatefulWidget {
  final GetInternshipRes internship;
  const InternshipsApplyNowFormPage({
    super.key,
    required this.internship,
  });

  @override
  State<InternshipsApplyNowFormPage> createState() =>
      _InternshipsApplyNowFormPageState();
}

class _InternshipsApplyNowFormPageState
    extends State<InternshipsApplyNowFormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController profileSummaryController = TextEditingController();
  TextEditingController skillsKnownController = TextEditingController();
  TextEditingController currentPositionController = TextEditingController();
  TextEditingController whyShouldWeHireYouController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    profileSummaryController.dispose();
    skillsKnownController.dispose();
    currentPositionController.dispose();
    whyShouldWeHireYouController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  String prepareMessage() {
    return '''

  Applicant Name - ${nameController.text},
  Applicant Phone Number - ${phoneController.text},
  Applicant Email ID - ${emailController.text},

  Current Position - ${currentPositionController.text},

  Profile Summary -
  ${profileSummaryController.text}.

  Skills Known - 
  ${skillsKnownController.text}.

  Q. Why should we Hire you?
  response - ${whyShouldWeHireYouController.text}

''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Apply Now',
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Consumer<CommonNotifier>(
        builder: (context, notifier, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Applicant Name',
                        keyboardType: TextInputType.text,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 12),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.text,
                        validator: (phone) {
                          if (phone == null || phone.isEmpty) {
                            return 'Please enter your Phone Number';
                          } else if (phone.length < 10) {
                            return 'Please enter a 10 digits Phone Number';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 12),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your Email';
                          } else if (!email.contains('@')) {
                            return 'Please give a valid Email';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 12),
                      CustomTextField(
                        controller: profileSummaryController,
                        hintText: 'Profile Summary',
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        maxLength: 100,
                        validator: (summary) {
                          if (summary == null || summary.isEmpty) {
                            return 'Please write something about you';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 12),
                      const HeightSpacer(size: 12),
                      CustomTextField(
                        controller: skillsKnownController,
                        hintText: 'Skills you have',
                        keyboardType: TextInputType.text,
                        validator: (skills) {
                          if (skills == null || skills.isEmpty) {
                            return 'Skills can\'t be empty';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 12),
                      CustomTextField(
                        controller: currentPositionController,
                        hintText: 'What is your current Position',
                        keyboardType: TextInputType.text,
                        validator: (position) {
                          if (position == null || position.isEmpty) {
                            return 'Please tell us about your current Position';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 12),
                      CustomTextField(
                        controller: whyShouldWeHireYouController,
                        hintText: 'Why should we Hire you?',
                        keyboardType: TextInputType.text,
                        maxLines: 7,
                        maxLength: 250,
                        validator: (hire) {
                          if (hire == null || hire.isEmpty) {
                            return 'Write down the reasons - Why should we hire you?';
                          }
                          return null;
                        },
                      ),
                      const HeightSpacer(size: 25),
                      CustomButton(
                        text: 'Submit Details',
                        onTap: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          final prefs = await SharedPreferences.getInstance();
                          String userId = prefs.getString('userId') ?? '';

                          //ApplyNow
                          notifier.applyNow(
                              job: null,
                              internship: widget.internship.id,
                              user: userId,
                              agentId: widget.internship.agentId);

                          String msg = prepareMessage();
                          // Send Email
                          notifier.sendEmail(
                              subject: 'Candidate Application',
                              content: msg,
                              reciever: widget.internship.email);
                          Get.back();
                        },
                      ),
                      const HeightSpacer(size: 20),
                      Text(
                          'Company will directly contact you, Else we will reach to you soon',
                          textAlign: TextAlign.center,
                          style: appstyle(
                              15, Color(kDark.value), FontWeight.bold)),
                      const HeightSpacer(size: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
