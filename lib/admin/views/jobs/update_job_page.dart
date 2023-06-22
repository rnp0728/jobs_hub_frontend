import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/controllers/my_jobs_provider.dart';
import 'package:jobs_hub/admin/models/job_req.dart';
import 'package:jobs_hub/user/models/response/jobs/get_job.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/widgets/custom_text_form_field.dart';
import 'package:jobs_hub/widgets/editable_string_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateJobsPage extends StatefulWidget {
  final GetJobRes job;
  const UpdateJobsPage({super.key, required this.job});

  @override
  State<UpdateJobsPage> createState() => _UpdateJobsPageState();
}

class _UpdateJobsPageState extends State<UpdateJobsPage> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  TextEditingController companyCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController salaryCtrl = TextEditingController();
  TextEditingController periodCtrl = TextEditingController();
  TextEditingController contractCtrl = TextEditingController();

  List<String> requirements = [];
  List<String> skillsRequired = [];

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.job.title);
    locationCtrl = TextEditingController(text: widget.job.location);
    companyCtrl = TextEditingController(text: widget.job.company);
    emailCtrl = TextEditingController(text: widget.job.email);
    descriptionCtrl = TextEditingController(text: widget.job.description);
    salaryCtrl = TextEditingController(text: widget.job.salary);
    periodCtrl = TextEditingController(text: widget.job.period);
    contractCtrl = TextEditingController(text: widget.job.contract);

    requirements = widget.job.requirements;
    skillsRequired = widget.job.skillsRequired;
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    companyCtrl.dispose();
    locationCtrl.dispose();
    contractCtrl.dispose();
    salaryCtrl.dispose();
    periodCtrl.dispose();
    descriptionCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Update Job Details',
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
      body: Consumer<MyJobsNotifier>(builder: (context, myJobsNotifier, child) {
        myJobsNotifier.imageFil.add(widget.job.imageUrl);
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Form(
              key: myJobsNotifier.formKey,
              child: Column(
                children: [
                  const HeightSpacer(size: 20),
                  const HeadingWidget(text: 'Company Details'),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: companyCtrl,
                    label: 'Company Name',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Company Name';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: emailCtrl,
                    label: 'Company Email',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Company Email';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: locationCtrl,
                    label: 'Company Location',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Company Location';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  const HeadingWidget(text: 'Job Details'),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: titleCtrl,
                    label: 'Job Title',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Job Title';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: descriptionCtrl,
                    label: 'Job Description',
                    maxLines: 7,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Job Description';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: salaryCtrl,
                    label: 'Salary',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the salary amount';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: periodCtrl,
                    label: 'Period',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter period like monthly or yearly';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  CustomTextFormField(
                    controller: contractCtrl,
                    label: 'Contract',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter contract type (Part-Time / Full-Time)';
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  EditableStringList(
                    label: 'Requirements & Responsibilities',
                    stringList: requirements,
                    updateListInState: (list) {
                      for (var element in list) {
                        if (!requirements.contains(element)) {
                          requirements.add(element);
                        }
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add some requirements';
                      }
                      return null;
                    },
                    saveValidator: (value) => null,
                  ),
                  const HeightSpacer(size: 10),
                  EditableStringList(
                    label: 'Skills Required',
                    stringList: skillsRequired,
                    updateListInState: (list) {
                      for (var element in list) {
                        if (!skillsRequired.contains(element)) {
                          skillsRequired.add(element);
                        }
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add some required skills';
                      }
                      return null;
                    },
                    saveValidator: (value) => null,
                  ),
                  const HeightSpacer(size: 24),
                  CustomButton(
                    onTap: () async {
                      if (!myJobsNotifier.validAndSave()) {
                        Get.snackbar(
                          'Updation Failed',
                          'Please Fill the details Properly...',
                          colorText: Color(kLight.value),
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.add_alert),
                        );
                      } else if (myJobsNotifier.imageFil.isEmpty &&
                          myJobsNotifier.imageUrl == null) {
                        Get.snackbar(
                          'Company Logo Missing',
                          'Please upload an Logo to proceed',
                          colorText: Color(kLight.value),
                          backgroundColor: Color(kLightBlue.value),
                          icon: const Icon(Icons.add_alert),
                        );
                      } else {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String agentId = prefs.getString('userId') ?? '';
                        myJobsNotifier.updateJob(
                            model: JobsReqModel(
                                email: emailCtrl.text,
                                title: titleCtrl.text,
                                location: locationCtrl.text,
                                company: companyCtrl.text,
                                description: descriptionCtrl.text,
                                salary: salaryCtrl.text,
                                contract: contractCtrl.text,
                                period: periodCtrl.text,
                                imageUrl: myJobsNotifier.imageUrl!,
                                agentId: agentId,
                                requirements: requirements,
                                skillsRequired: skillsRequired));
                      }
                    },
                    text: 'Update',
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
