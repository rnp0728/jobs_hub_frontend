import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Terms And Conditions',
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
              const HeightSpacer(size: 10),
              Text(
                '''
Welcome to Jobs Hub, a portal of Scholiverse Educare Private Limited (hereinafter referred to as the SEPL). These terms and conditions of use ("Terms") constitute a legal agreement between you and SEPL. Use of this Site constitutes your unconditional acceptance of these Terms herein and by all terms, policies and guidelines incorporated by reference. These Terms apply to your use of this Site, and do not alter in any way the terms or conditions of any other agreement you may have with SEPL, its subsidiaries or affiliates. If you are using the Site on behalf of any entity, you further represent and warrant that you are authorized to accept these Terms on such entity's behalf, and that such entity agrees to indemnify SEPL for violations of these Terms. If you do not agree with these terms, please do not use this Site.

Any individual and organisation wanting to make use of Site to post internships/jobs (hereinafter referred to as the "Jobs") for self or for an organisation he/she represents is referred to as "Employer" or "Employers" as context may demand.

Any individual wanting to make use of Site to apply to Jobs listed on Jobs Hub is referred to as "Applicant" or "Applicants" as context may demand.
''',
                textAlign: TextAlign.start,
                style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
              ),
              const HeightSpacer(size: 10),
              Text("Registration Data and Account Security",
                  textAlign: TextAlign.start,
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'In consideration of your use of the Site, you agree to: (a) provide accurate, current and complete information about you as may be prompted by any registration forms on the Site ("Registration Data"); (b) maintain and promptly update the Registration Data, and any other information you provide to SEPL, to keep it accurate, current and complete; (c) maintain the security of your password and identification; (d) notify SEPL immediately of any unauthorized use of your account or any other breach of security; (e) accept all responsibility for any and all activities that occur under your account; and (f) accept all risks of unauthorized access to the Registration Data and any other information you provide to SEPL. Please refer to our Privacy Policy for more details on how we collect, store, use, and retain your data on the Site.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              Text("Most Important Terms & Conditions for Employers",
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'These Terms, specifically for Employers, are in addition to the other generic Terms & Conditions listed on the page which are common to all the users of the site and which you are required to go through. Any violation of these Terms may result in, but not limited to, an Employer\'s Job being declined for publication on JobsHub and/or his/her account being permanently blocked and/or appropriate legal action being initiated against him/her by SEPL.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(
                text: "Most Important T&C for Applicants",
              ),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'These Terms, specifically for Applicants, are in addition to the other generic Terms & Conditions listed on the page which are common to all the users of the site and which you are required to go through. Any violation of these T&Cs may result in, but not limited to, an applicant\'s Job application being declined and/or his/her account being permanently blocked and/or suitable legal action being initiated against him/her by SEPL.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''
1. If you have applied for a Job on JobsHub and receive a communication from JobsHub or Employer regarding your application, you must respond to it with-in 72 hours.

2. Once you accept a Job offer, you must make every possible effort to join and start the Job on time. To not show up or to decline an earlier accepted Job offer at the last moment, or to go incommunicado creates a very poor impression of you in front of the Employer and reduces the credibility of the Applicant community at large. Any such behaviour will not only result in your account being blocked on JobsHub but we will also report it to your college administration wherever applicable.

3. You must provide accurate and complete information at the time of Job application or creating an account on JobsHub – any misrepresentation of information, or hiding of material information, or impersonation would result in your account being blocked on the site and you being reported to your college administration wherever applicable.
4. You must pay attention to a Job's complete details (profile, location, remuneration, skills required, etc.) before applying for it. Irrelevant applications will result in your account being penalized (we may stop you from applying to future Jobs or block your account all together)

5. You are strictly prohibited from transferring/selling/sharing Employers' data (contact details etc.), for free or for a fee, with any other entity. Any such attempt would result in your account on JobsHub being permanently blocked and would be liable for legal action against you.

6. JobsHub community is a community of sincere users who are known for and are expected to demonstrate high standards of professionalism in their dealings with other users and Employers – you are required to maintain these standards and decorum of the community. All your communications with other users of JobsHub (through JobsHub Chat or otherwise) should be professional and must not contain any obscene or offensive content.

7. You agree to have gone through the ‘Safety Tips for Applicants' section of these Terms and have understood the same.

8. While it is our endeavor to provide you with accurate and reliable Job information; it is always possible for an error to occur. Hence, you must conduct your own due diligence and research about an employer or organisation before starting a Job and take full responsibility of the same. You further agree to have read and understood the ‘Disclaimers' section of these Terms and explicitly and specifically agree to it.

9. If you come across any suspicious activity, content or behaviour on JobsHub by an Employer or another user, you must report it to JobsHub immediately so that necessary actions can be taken – this is both your duty and obligation.

10. While we make our best efforts to bring you the best Job opportunities possible, JobsHub does not guarantee a Job to a student.

11. Upon registration, your registered email id and phone number will be automatically subscribed to receive email, Whatsapp notifications and SMS notifications from JobsHub. You may opt out of it anytime.

12. JobsHub reserves the right to remove your photo if it doesn't feature your likeness or a headshot photograph. If we take down your photo, you can upload a new one of yourself to make things right.

13. If you upload your profile picture, you are authorizing JobsHub to share it with employers and other relevant users of JobsHub platform.

''',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(size: 8),
              Text("Disclaimers",
                  textAlign: TextAlign.start,
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'This Site and its content are provided "as is" and SEPL and its directors, employees, content providers, agents and affiliates exclude, to the fullest extent permitted by applicable law, any warranty, express or implied, including, without limitation, any implied warranties of merchantability, satisfactory quality or fitness for a particular purpose. SEPL will not be liable for any damages of any kind arising from the use of this site. The functions embodied on or in the materials of this site are not warranted to be uninterrupted or without error. You, not SEPL and/or JobsHub, assume the entire cost of all necessary care or correction due to your use of this site or content. SEPL makes no warranty that the site or the content is free from infection by viruses or anything else that has contaminating or destructive properties. SEPL uses reasonable efforts to ensure the accuracy, correctness and reliability of the Content, but we make no representations or warranties for the same. Images of people or places displayed on the Site are either the property of, or used with permission by, SEPL or third parties. The use of these images by you, or anyone else authorized by you, is prohibited unless specifically permitted by these Terms or specific permission provided elsewhere on the Site or by separate license or agreement. Any unauthorized use of these images may violate copyright laws, trademark laws, the laws of privacy and publicity, and other applicable laws.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              Text("Rights to Website and Contents thereof",
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'This Site is owned and operated by SEPL. All the content featured or displayed on this Site, including, but not limited to, text, graphics, data, images(photographic and moving), illustrations, software and selection and arrangement thereof ("Content"), is owned by SEPL. All elements of this Site, including, but not limited to, the general design and the Content thereof, are protected by copyright, moral rights, trademark and other laws related to the protection of intellectual property rights. Except for, as explicitly permitted under this, or other written license or agreement with SEPL, no portion or element of this Site or its content may be copied or retransmitted via any means. All related rights shall remain the exclusive property of SEPL, its licensors or its third-party image partners.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Using the Website"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'This Site and its Content are intended for Users of JobsHub.com, the division of SEPL. You may not use this Site or the content for any purpose, which is not related to your business with JobsHub.com. Any use of the Content, this Site or any of its functionality for a purpose not permitted by these Terms is grounds for the immediate revocation of any usernames, pass codes or other permissions that may have been granted by JobsHub.com on behalf of SEPL for use of this Site. You are specifically prohibited from: (i) downloading, copying, or retransmitting any or all of the Site or the Content without, or in violation of, a written license or agreement with SEPL; (ii) using any data mining or similar data gathering or extraction methods; (iii) manipulating or otherwise displaying the site or the content by using, framing or similar navigational technology; (iv) registering, subscribing, unsubscribing, or attempting to register, subscribe any party for any the site if you are not expressly authorized by such party to do so; and (v) using the Site or Content other than for its intended purpose. Such unauthorized use may also violate applicable laws including without limitation copyright and trademark laws, the laws of privacy and publicity, and applicable communications regulations and statutes. You represent and warrant that you will comply with all applicable regulations, including, without limitation, those relating to the internet, data, e-mail, privacy and the transmission of technical data exported from India or the Country in which you reside.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Trademarks"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'SEPL’s Trademarks, the SEPL’s and JobsHub logo, and any other product or service name or slogan contained in the Site are trademarks of SEPL and its suppliers or licensors, and may not be copied, imitated or used, in whole or in part, without the prior written permission of SEPL or the applicable trademark holder. You may not use meta-tags or any other "hidden text" utilizing content or any other name, trademark or product or service name of SEPL without our prior written permission. In addition, the look and feel of the Site, including all page headers, Site name and logo, custom graphics, button icons and scripts, is the service mark, trademark and/or trade dress of SEPL and may not be copied, imitated or used, in whole or in part, without our prior written permission. All other trademarks, registered trademarks, product names and company names or logos mentioned in the Site are the property of their respective owners. Reference to any products, services, processes or other information, by trade name, trademark, manufacturer, supplier or otherwise does not constitute or imply endorsement, sponsorship or recommendation thereof by us.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Indemnity"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'You agree to defend, indemnify and hold harmless SEPL, its subsidiaries, affiliates, licensors, employees, agents, third party information providers and independent contractors against any claims, damages, costs, liabilities and expenses (including, but not limited to, reasonable attorneys\' fees) arising out of or related to any User Content that you post, store or otherwise transmit on or through the Site, your conduct, your use or inability to use the Site, your breach or alleged breach of the Site Terms or of any representation or warranty contained herein, your unauthorized use of the Content, or your violation of any rights of another. Further you shall indemnify SEPL, its subsidiaries, its affiliates and licensors against any loss, expense, cost or damage incurred by any or all of them as a result of your breach of these Terms or your unauthorized use of the Content or the Site.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Termination"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Notwithstanding any of these Site Terms, SEPL reserves the right, without notice and in its sole discretion, to terminate your account and/or to block your use of the Site.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Changes to Site Terms"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'You hereby expressly agree that once you or any other person have started the process of downloading content from the site by expressly, without reservation, agreeing to the terms and conditions of the site and license agreement, by clicking and accepting them and have further submitted your credit card/ any other card details to the site/internet banking service provider for payment and your account gets debited no chargeback claim/dispute with regard to the failure of delivery of Product/ Content or the use/misuse of such credit card or any other card, filed by you/on your behalf with the Credit Card Provider/Internet banking service provider or any Bank/Financial Institution shall be binding on SEPL or SEPL’s Merchant Bank. You accept and take full responsibility towards the ownership/possession and use of your credit card or any other card. You expressly waive and consciously give up any/all rights you may have in law or in any agreement between you and the credit card or any other card provider/internet service provider or under network rules and regulations to raise any dispute to claim any charge back or any process fee from any Bank/Financial Institution/ Internet banking service provider affecting SEPL in any manner pecuniary or otherwise on any grounds whatsoever including non delivery of Product/Content or fraudulent or improper transactions by the unauthorized/improper use of your credit/debit card or any other card. This understanding that you will have no right to claim any chargeback is a material condition of this agreement and once you hereby expressly agree to it you shall be stopped from challenging/disputing it in any adjudication/proceeding before any Bank/Financial institution/ Internet banking service provider or Court or otherwise. Without prejudice to SEPL’s right to defend its interest(s), SEPL shall not be made a party to any chargeback proceedings before any Bank/Financial institution/ Internet banking service provider or court and in no case be required to prove the transaction effected by the use of your credit/debit or any other card was legitimate and genuine, or that SEPL has actually provided you the downloaded content. Please refer to our Refund & Cancellation policy for more details.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Severance & Waiver"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'No action of SEPL, other than an express written waiver or amendment, may be construed as a waiver or amendment of any of these Terms. If any clause in these Terms is found to be unenforceable, wherever possible, it will not affect any other clause and each will remain in full force and effect. We reserve the right to change these Terms, the Content displayed on the Site, any license contained on the Site and any other information or license terms without prior notice. These Terms set out the entire agreement between SEPL and you relating to your use of this Site. Any rights not expressly granted herein are reserved.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Juridiction"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'All license agreements, use or any issues arising out of any activity regarding the use of this website will be governed by the laws of India and subject to the exclusive jurisdiction of Odisha.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 15),
            ],
          ),
        ),
      ),
    );
  }
}
