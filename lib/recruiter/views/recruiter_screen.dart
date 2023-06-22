import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/views/internships/internships_details_page.dart';
import 'package:jobs_hub/admin/views/internships/internships_search_page.dart';
import 'package:jobs_hub/admin/views/jobs/jobs_details_page.dart';
import 'package:jobs_hub/admin/views/users_search_page.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:jobs_hub/recruiter/controllers/applicants_provider.dart';
import 'package:jobs_hub/recruiter/views/internships/internships_adding_page.dart';
import 'package:jobs_hub/recruiter/views/jobs/jobs_adding_page.dart';
import 'package:jobs_hub/recruiter/widgets/applicants_tile.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/controllers/internships_provider.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/app_style.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:jobs_hub/user/views/ui/common/about_page.dart';
import 'package:jobs_hub/user/views/ui/common/privacy_policy_page.dart';
import 'package:jobs_hub/user/views/ui/common/safety_tips_page.dart';
import 'package:jobs_hub/user/views/ui/common/terms_conditions_page.dart';
import 'package:jobs_hub/user/views/ui/common/update_password_page.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/custom_internship_tile.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/internship_search_widget.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/custom_tile.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_search_widget.dart';
import 'package:provider/provider.dart';

enum Page { home, job, internship, applicants }

class RecruiterHomeScreen extends StatefulWidget {
  const RecruiterHomeScreen({super.key});

  @override
  State<RecruiterHomeScreen> createState() => _RecruiterHomeScreenState();
}

class _RecruiterHomeScreenState extends State<RecruiterHomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  List<String> appBarTitle = [
    'Jobs',
    'Internships',
    'Applicants',
    'More Options'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    var jobsNotifier = Provider.of<JobsNotifier>(context);
    var internshipsNotifier = Provider.of<InternshipsNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: appBarTitle[_currentIndex],
          actions: [
            GestureDetector(
              onTap: () {
                loginNotifier.logOut();
                Get.snackbar(
                  'Log Out',
                  'Logged out Successfully!, Hope to see you again soon.',
                  colorText: Color(kLight.value),
                  backgroundColor: Color(kLightBlue.value),
                  icon: const Icon(Icons.add_alert),
                );
                Get.off(() => const LoginPage());
              },
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: const Icon(Icons.logout),
              ),
            )
          ],
          child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const Icon(FontAwesome5Regular.user)),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            // Container(
            //   color: Colors.blueGrey,
            // ),
            PostedJobsWidget(),
            PostedInternshipsWidget(),
            ApplicantsListWidget(),
            MoreOptionsWidget(),
          ],
        ),
      ),
      floatingActionButton: (_currentIndex == 2 || _currentIndex == 3)
          ? const SizedBox.shrink()
          : FloatingActionButton(
              hoverColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                if (_currentIndex == 0) {
                  Get.to(() => const JobsAddingPage())
                      ?.then((value) => jobsNotifier.getJobsAddedByAgent());
                }
                if (_currentIndex == 1) {
                  Get.to(() => const InternshipAddingPage())?.then((value) =>
                      internshipsNotifier.getInternshipsAddedByAgent());
                }
              },
              backgroundColor: Color(kLight.value),
              child: Icon(Icons.add, color: Color(kOrange.value)),
            ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        animationDuration: const Duration(milliseconds: 220),
        backgroundColor: Colors.transparent,
        showElevation: true,
        containerHeight: 65,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          // BottomNavyBarItem(
          //     title:
          //         Text('Home', style: TextStyle(color: Color(kOrange.value))),
          //     icon: Icon(AntDesign.home, color: Color(kOrange.value))),
          BottomNavyBarItem(
              title:
                  Text('Jobs', style: TextStyle(color: Color(kOrange.value))),
              icon: Icon(Icons.work_outline_outlined,
                  color: Color(kOrange.value))),
          BottomNavyBarItem(
              title: Text('Internships',
                  style: TextStyle(color: Color(kOrange.value))),
              icon: Icon(Icons.rocket_launch_outlined,
                  color: Color(kOrange.value))),
          BottomNavyBarItem(
            title: Text(
              'Applicants',
              style: TextStyle(color: Color(kOrange.value)),
            ),
            icon: Icon(
              Icons.person_pin_outlined,
              color: Color(kOrange.value),
            ),
          ),
          BottomNavyBarItem(
              title: Text(
                'More Options',
                style: TextStyle(color: Color(kOrange.value)),
              ),
              icon: Icon(
                Icons.menu_outlined,
                color: Color(kOrange.value),
              )),
        ],
      ),
    );
  }
}

class ApplicantsListWidget extends StatelessWidget {
  const ApplicantsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicantsNotifier>(
        builder: (context, applicantNotifier, child) {
      applicantNotifier.getApplicants();
      return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const HeightSpacer(size: 10),
              // Padding(
              //   padding: EdgeInsets.only(left: 10.w),
              //   child: UsersSearchWidget(
              //     onTap: () {
              //       Get.to(() => const UsersSearchPage());
              //     },
              //   ),
              // ),
              const HeightSpacer(size: 10),
              FutureBuilder(
                  future: applicantNotifier.applicantsList,
                  builder: (context, applicantNotifier) {
                    if (applicantNotifier.connectionState ==
                        ConnectionState.waiting) {
                      return const HorizontalShimmer();
                    } else if (applicantNotifier.hasError) {
                      return Center(
                        child: Text('Error ${applicantNotifier.error}'),
                      );
                    }
                    final applicants = applicantNotifier.data;
                    if (applicants?.isEmpty ?? true) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/applicants.png'),
                            Text(
                              'No Applicants',
                              style: appstyle(
                                  20, Color(kOrange.value), FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: applicants?.length,
                      itemBuilder: (context, index) {
                        final applicant = applicants![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: ApplicantsTile(
                            onTap: () {
                              // TODO
                            },
                            applicant: applicant,
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ));
    });
  }
}

class PostedInternshipsWidget extends StatelessWidget {
  const PostedInternshipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InternshipsNotifier>(
        builder: (context, internshipsNotifier, child) {
      internshipsNotifier.getInternshipsAddedByAgent();
      return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: InternshipSearchWidget(
                  onTap: () {
                    Get.to(() => const InternshipsSearchPage());
                  },
                ),
              ),
              const HeightSpacer(size: 10),
              FutureBuilder(
                  future: internshipsNotifier.agentInternshipsList,
                  builder: (context, internshipsSnapshot) {
                    if (internshipsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const HorizontalShimmer();
                    } else if (internshipsSnapshot.hasError) {
                      return Center(
                        child: Text('Error ${internshipsSnapshot.error}'),
                      );
                    }
                    final internships = internshipsSnapshot.data;
                    if (internships?.isEmpty ?? true) {
                      return const Center(
                        child: Text('No Internships Posted Yet'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: internships?.length,
                      itemBuilder: (context, index) {
                        final internship = internships![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: CustomInternshipTile(
                            onTap: () {
                              Get.to(
                                () => InternshipDetailsPage(
                                  id: internship.id,
                                  title: internship.company,
                                ),
                              );
                            },
                            internship: internship,
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ));
    });
  }
}

class PostedJobsWidget extends StatelessWidget {
  const PostedJobsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(builder: (context, jobsNotifier, child) {
      jobsNotifier.getJobsAddedByAgent();
      return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: JobsSearchWidget(
                  onTap: () {
                    Get.to(() => const UsersSearchPage());
                  },
                ),
              ),
              const HeightSpacer(size: 10),
              FutureBuilder(
                  future: jobsNotifier.agentJobsList,
                  builder: (context, jobsSnapshot) {
                    if (jobsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const HorizontalShimmer();
                    } else if (jobsSnapshot.hasError) {
                      return Center(
                        child: Text('Error ${jobsSnapshot.error}'),
                      );
                    }
                    final jobs = jobsSnapshot.data;
                    if (jobs?.isEmpty ?? true) {
                      return const Center(
                        child: Text('No Jobs Posted Yet'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: jobs?.length,
                      itemBuilder: (context, index) {
                        final job = jobs![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: CustomTile(
                            onTap: () {
                              Get.to(
                                () => JobDetailsPage(
                                  id: job.id,
                                  title: job.company,
                                ),
                              );
                            },
                            job: job,
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ));
    });
  }
}

class MoreOptionsWidget extends StatefulWidget {
  const MoreOptionsWidget({
    super.key,
  });

  @override
  State<MoreOptionsWidget> createState() => _MoreOptionsWidgetState();
}

class _MoreOptionsWidgetState extends State<MoreOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Builder(builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/what-happend.png',
                  fit: BoxFit.contain,
                ).animate().fade(duration: const Duration(seconds: 1)),
              ),
              const HeightSpacer(size: 15),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    iconColor: Color(kDark.value),
                    titleTextStyle:
                        appstyle(15, Color(kDark.value), FontWeight.w500),
                    leading: const Icon(Icons.security_outlined),
                    title: const Text('Safety Tips'),
                    onTap: () {
                      Get.to(() => const SafetyTipsPage());
                    },
                  ),
                  ListTile(
                    iconColor: Color(kDark.value),
                    titleTextStyle:
                        appstyle(15, Color(kDark.value), FontWeight.w500),
                    leading: const Icon(Icons.note_alt_outlined),
                    title: const Text('Terms and Conditions'),
                    onTap: () {
                      Get.to(() => const TermsAndConditionsPage());
                    },
                  ),
                  ListTile(
                    iconColor: Color(kDark.value),
                    titleTextStyle:
                        appstyle(15, Color(kDark.value), FontWeight.w500),
                    leading: const Icon(Icons.lock_outline_rounded),
                    title: const Text('Privacy Policy'),
                    onTap: () {
                      Get.to(() => const PrivacyPolicyPage());
                    },
                  ),
                  ListTile(
                    iconColor: Color(kDark.value),
                    titleTextStyle:
                        appstyle(15, Color(kDark.value), FontWeight.w500),
                    leading: const Icon(Icons.info),
                    title: const Text('About JobsHub'),
                    onTap: () {
                      Get.to(() => const AboutUsPage());
                    },
                  ),
                  ListTile(
                    iconColor: Color(kDark.value),
                    titleTextStyle:
                        appstyle(15, Color(kDark.value), FontWeight.w500),
                    leading: const Icon(Icons.edit_note_outlined),
                    title: const Text('Update Password'),
                    onTap: () {
                      Get.to(() => const UpdatePasswordPage());
                    },
                  ),
                  ListTile(
                    iconColor: Color(kDark.value),
                    titleTextStyle:
                        appstyle(15, Color(kDark.value), FontWeight.w500),
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Logout'),
                    onTap: () {
                      loginNotifier.logOut();
                      Get.snackbar(
                        'Log Out',
                        'Logged out Successfully!, Hope to see you again soon.',
                        colorText: Color(kLight.value),
                        backgroundColor: Color(kLightBlue.value),
                        icon: const Icon(Icons.add_alert),
                      );
                      Get.off(() => const LoginPage());
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
