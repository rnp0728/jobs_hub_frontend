import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Privacy Policy',
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              Text(
                'This Privacy Policy applies to the online services offered by Internshala at internshala.com, its subdomains and Internshala’s app on Google Play Store. These are henceforth collectively known as Services.',
                textAlign: TextAlign.center,
                style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
              ),
              const HeightSpacer(size: 10),
              Text("Overview",
                  textAlign: TextAlign.left,
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'We respect your privacy and strive to provide a safe, secure user experience. This privacy statement sets forth our online data collection and usage policies and practices. By using our services, you consent to the policies and practices described in this statement. Your data will be stored and processed on our servers which may be inside or outside India and your usage of the Services constitutes consent to the transfer of your data out of India. Our Services may contain links to other website over which we have no control and we are not responsible for the privacy policies or practices of other websites to which you navigate from our Services. We encourage you to review the privacy policies of these other websites so you can understand how they collect, use and share your information. This privacy statement applies solely to the information we collect on internshala.com and its sub-domains and not to information collected otherwise.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              Text("Collection of Information",
                  textAlign: TextAlign.left,
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '''
Personal information provided by you: In some areas of our Services, we request you to provide or submit personal information including your name, address, email address, telephone number, contact information, billing information, education details, work place details, and any other information from which your identity is discernible. Internshala also collects or may collect demographic information that is not unique to you such as your ZIP code, age, preferences and gender. Example of such a situation could include, but is not limited to when you sign up to use our service, post a resume or enter a contest or survey.
We may collect, process and store your information associated with your Google account if you choose to sign in using Google. When you sign in to your account with your Google account information, you consent to our collection, storage, and use of the information that you make available to us through your Google account in accordance with this Privacy Policy. This could include your name, email address and phone number associated with your Google account. If you are registering as an employer and choose to authenticate your company using social media, then with your explicit consent to our data collection, we will collect your page name and count of followers as available to us through your Google or Facebook or Instagram account. We also use Youtube API services to collect your channel name and count of subscribers for account verification purposes. This data will be collected, processed and stored in accordance with this Privacy Policy.

Information about your contacts: When you choose to share content on Internshala with friends using the Google+ share feature and sign in using your Google account, we may collect, process and store information of the contacts (email addresses of contacts) associated with your Google account. Also, when you share content with your friends through SMS share option on Internshala, we may collect, process and store information of the contacts (phone numbers) to whom you choose to send the SMS.

Information collected through use of service: We also gather or may gather certain information about your use of our Services, such as what areas you visit and what features you access. Moreover, there is information about your computer hardware and software that is or may be collected by us. This information can include without limitation your IP address, browser type, domain names, access times and referring website addresses and can be used by Internshala as it deems fit. If you message applicants through the Internshala chat platform, we also collect and may access your chat history.

''',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(
                text: "Retention of Information",
              ),
              const HeightSpacer(size: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Since we believe that managing your career is a life-long process, we retain indefinitely all the information we gather about you in an effort to make your repeat use with us more efficient, practical, and relevant. You can correct or update your account profile and resume at any time. You may choose to delete your account, following which we will either delete or de-identify the data.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(
                text: "Sharing of Information",
              ),
              const HeightSpacer(size: 8),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''
1. If you are an employer, information related to your internship and/or job post such as organisation name, URL, and description, job description, skills required etc. is published online and can be viewed by anyone visiting Internshala site and app. This information may also appear in search websites like Google. Further, we may share your personal information (including contact details) with students who apply to your internships and/or jobs or get hired by you through Internshala.
2. If you are an applicant, we may share your personal information with employers whose internships and/or jobs you apply to or whose internships and/or jobs we feel may be relevant for you or who may come across your profile through a search of our user base.
3. We may share your information with third party individuals, contractors, companies and other service providers that perform services on our behalf or in partnership with us. For example, we may require to pass on your data to a partner who might be responsible for the delivery of a training program that you may have voluntarily signed up for.
4. Additionally, you may have the option to share your information and activities on Internshala through social media. We do not have control over information shared with third party social networks and you should review the policies of those networks before consenting to share information with them.
5. If you post any of your personal information in public areas of Internshala, such as in online forums, chat rooms, comments section etc. this information will be accessible to everyone on the public internet. It may be collected and used by others over whom Internshala has no control. We are not responsible for the use made by third parties of information you post or otherwise make available in public areas of this website.
6. When we send you an email or SMS, we use a third party service. In this case, it becomes necessary to pass on your email address/ mobile number to the third party. While we only work with reputed service providers in this regard, we are not responsible for the use made by them of this information.
7. Internshala reserves the right to publish the internship and/or job post of companies on social media platforms and 3rd party websites like LinkedIn, Indeed, Sheroes, Qween, etc.along with newspapers and magazines, in order to increase the visibility of the post.
8. We may also share your information in order to investigate, prevent, or take action about possible illegal activities or to comply with legal process. We may also share your information with third parties to investigate and address violations of this Privacy Policy or the Terms of Service, or to investigate and address violations of the rights of third parties and/or Internshala, our employees, users, or the public. This may involve the sharing of your information with law enforcement, government agencies, courts, and/or other organizations.
''',
                      style:
                          appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(size: 8),
              Text("Editing Information",
                  textAlign: TextAlign.left,
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              Text(
                '''
If you are a student, you may edit your personal information and profile by visiting your resume section. Certain data (such as applications you may have made) cannot be edited.

If you are an employer, you may edit your personal information and information about your organization by visiting the profile (personal details and organization details) section. Certain data (such as internships you may post, applications you may have processed) cannot be edited.

                ''',
                style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
              ),
              const HeightSpacer(size: 8),
              Text("Cookies and Pixel Tags",
                  style: appstyle(18, Color(kDark.value), FontWeight.w600)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '''
We and third parties with whom we partner, may use cookies, web beacons, pixel tags etc. to collect information regarding your use of Internshala and third party websites. A cookie is a small text file that is stored on your computer that enables us to remember you (for example, as a registered user) and your actions when you visit our website. This helps us remember your preferences and searches, improve your experience (for example, by keeping you logged in), customize content according to your preferences and perform analytics, and assist with security and administrative functions. Cookies may be persistent or stored only during an individual session ,as necessary. A pixel tag is a tiny graphic with a unique identifier embedded invisibly in an email and may be used to track whether the email has been opened and for other analytics.

Most modern browsers will allow you to disable some/all cookies for any website. However, this is not recommended and doing so may interfere with normal functioning of Internshala. If you do not turn cookies off, please make sure you logout when you finish using a shared computer.

''',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Children"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Internshala is not intended for children under 13 years of age. If you are less than 13 years old at the time of your first visit to Internshala, you are prohibited from using the website further entirely on your own. You may do so under parental guidance. However, please note that we have no way of determining your age when you visit our website or whether you have parental supervision available or not. We do not intend to and do not knowingly collect personal information from children under 13. However, since we do not collect information on a user\'s birth date and proof of same, there is no foolproof way for us to ensure the same.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Security of Information"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '''
We have implemented generally accepted industry standards in terms of security measures to protect your information on Internshala. The third party payment service providers (payment gateways) are all validated as compliant with the payment card industry standard (generally referred to as PCI compliant service providers).

While we try our best to safeguard information, there may be factors beyond our control that may result in unwanted disclosure of information. We assume no liability or responsibility for disclosure of your information due to causes beyond our control.

In order to keep personal information secure, you must not share your password or other security information (for example, unique keys) of your Internshala account with anyone. If you are using a shared computer, please make sure you logout after every use. If we receive instructions using your email and password, we will consider that the instructions have been authorized by you.

''',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "GDPR Entitlement"),
              Text(
                'EU General Data Protection Regulation (GDPR) has provided the below rights to the EU residents:',
                style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '''
1. Right to information - the purposes for processing Personal Information and the rights of the individual.
2. Right to access the Personal Information that are processed.
3. Right to erasure (”Right to be forgotten”).
4. Right to rectification.
5. Right to restriction of processing.
6. Right to object (opt-out) to processing.

''',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              RichText(
                  text: TextSpan(
                      style: appstyle(14, Color(kDark.value), FontWeight.w500),
                      children: [
                    const TextSpan(
                        text:
                            'EU residents can exercise these rights by raising a request directly at '),
                    TextSpan(
                      text: 'privacy@internshala.com.',
                      style: appstyle(
                          14, Color(kLightBlue.value), FontWeight.w500),
                    ),
                  ])),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "No Guarantees"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'While this Privacy Policy states our standards for maintenance of data and we will make efforts to meet them, we are not in a position to guarantee these standards. There may be factors beyond our control that may result in disclosure of data. As a consequence, we disclaim any warranties or representations relating to maintenance or nondisclosure of data.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Changes to this Pricavy Policy"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'We may make changes to this Policy from time to time. We may notify you of substantial changes to this Policy either by posting a prominent announcement on our Services and/or by sending a message to the e-mail address you have provided to us. You are advised to refer to this page to know about our latest Privacy Policy.',
                  style: appstyle(14, Color(kDarkBlue.value), FontWeight.w500),
                ),
              ),
              const HeightSpacer(size: 8),
              const HeadingWidget(text: "Severance & Waiver"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  '''
Rudra Narayan Panda
Creator of the App
Contact - rnp0728@gmail.com
              ''',
                  textAlign: TextAlign.left,
                  style:
                      appstyle(14, Color(kDarkPurple.value), FontWeight.w500),
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
