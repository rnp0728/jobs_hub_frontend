import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/common/report_complaint.dart';

class SafetyTipsPage extends StatelessWidget {
  const SafetyTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Safety Tips',
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: width,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/safety.jpg',
                ),
              ),
              ReusableText(
                text: 'Safety Tips',
                style: appstyle(24, Color(kDark.value), FontWeight.bold),
              ),
              const HeightSpacer(size: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'At Jobs Hub, we are committed to making your online experience a safe and reliable one. The following information is designed to help internship/job seekers indetify common red flags and avoid fraud.',
                  textAlign: TextAlign.center,
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 10),
              Divider(
                height: 9,
                thickness: 0.9,
                color: Color(kDarkGrey.value),
              ),
              const HeightSpacer(size: 10),
              const HeadingWidget(
                text: "Asking for Money",
              ),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'If an employer asks you for money in the form of training fee, application/admission fee, security deposit, test fee, laptop fee, documentation fee, interview reservation fee, etc., please do not make any payment and report him/her immediatety. Charging money is not only a violation of Jobs Hub\'s rules, it is often a scam.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(
                text: "Discrepancy in job description",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'An employer could offer you a different job than what you had applied for on Internshala. If the job offered involves any of the following, please report it: ',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$bullet Consuming alcohol or smoking or inducing others to do so',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                    Text(
                      '$bullet Promoting explicit religious content, a particular religious personality, or a sect, etc',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                    Text(
                      '$bullet Gambling or related games',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                    Text(
                      '$bullet Network-level marketing - where your only role is to promote or sell a product or service to your friends and family',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                    Text(
                      '$bullet Watching or creating content for adult websites',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                    Text(
                      '$bullet Undertaking paid courses, workshops or training programmes as part of the internship/job',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(size: 8),
              Text("Refusal to pay stipend/salary or issue certificate",
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'On JobsHub, jobs with CTC less than 2 LPA and unpaid internships are not allowed, unless explicitly mentioned so in the internship/job post. If you come across any such incident where the stipend/salary mentioned on Internshala and the offer letter do not match, do notify us.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'There also might be a case where the employer might stop responding to you or refuse to pay you the promised salary/stipend or issue the certificate of completion, after you have performed the assigned work.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Asking for irrelevant assignments"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Any assignment that an employer asks you to do should assess your suitability for the role, and should be relevant to the profile.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Please report employers, if they asks you to do extremely lengthy assignments which may involve making business strategies for their company, writing multiple articles for their blog, promoting their social media accounts in your network, increasing downloads of their app, or designing multiple graphics for their company. These assignments may be a scheme by the company to get free work done.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Asking for personal and bank details"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Be cautious of employers who ask for details like PIN, pan card, bank account, credit card, OTP, Aadhar, etc., via online channels, in exchange for a ‘special offer’. This may be a scammer trying to obtain your information to impersonate you.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Legitimate employers would have had sufficient interaction with you through interviews and would have expressed interest in hiring you, before requesting personal information like bank account details, pan card and marksheets.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Hateful or abusive conduct"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Employers are not allowed to make discriminatory or abusive comments about race, ethnicity, religious affiliation, sexual orientation or gender about any candidate. Any such attempt should be reported immediately.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 10),
              Divider(
                height: 9,
                thickness: 0.9,
                color: Color(kDarkGrey.value),
              ),
              const HeightSpacer(size: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 251, 245, 174)
                            .withOpacity(0.4),
                        const Color.fromARGB(255, 251, 245, 174)
                            .withOpacity(0.4),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.amber.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.filter_center_focus_rounded,
                        color: Colors.amber,
                      ),
                      const WidthSpacer(width: 7),
                      Flexible(
                        child: Text(
                          'To avoid discrepancies, we recommend that once you’re hired, you should request the employer for an offer letter clearly detailing all the important details such as roles & responsibilities, remuneration, payment mechanism, address and contact details of the employer.',
                          style: appstyle(14, Colors.amber, FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const HeightSpacer(size: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'We are Here to Help',
                  style: appstyle(26, Color(kDark.value), FontWeight.bold),
                ),
              ),
              Text(
                'If you have encountered any such suspicious activity, Please let us know',
                textAlign: TextAlign.center,
                style: appstyle(14, Color(kDark.value), FontWeight.w500),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                child: CustomButton(
                  text: 'Report a Complaint',
                  onTap: () {
                    Get.to(() => const ReportAComplaint());
                  }, //TODO
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
