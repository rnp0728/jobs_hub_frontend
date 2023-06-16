import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/controllers/users_provider.dart';
import 'package:jobs_hub/admin/views/courses/add_courses_page.dart';
import 'package:jobs_hub/admin/views/internships/add_internships_page.dart';
import 'package:jobs_hub/admin/views/internships/internships_details_page.dart';
import 'package:jobs_hub/admin/views/jobs/add_jobs_page.dart';
import 'package:jobs_hub/admin/views/jobs/jobs_details_page.dart';
import 'package:jobs_hub/admin/views/users_search_page.dart';
import 'package:jobs_hub/admin/widgets/course_tile.dart';
import 'package:jobs_hub/admin/widgets/user_tile.dart';
import 'package:jobs_hub/admin/widgets/users_search_widget.dart';
import 'package:jobs_hub/launch_urls.dart';
import 'package:jobs_hub/user/controllers/courses_provider.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/controllers/internships_provider.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:jobs_hub/user/views/ui/auth/profile.dart';
import 'package:jobs_hub/user/views/ui/common/about_page.dart';
import 'package:jobs_hub/user/views/ui/common/update_password_page.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/custom_internship_tile.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/internship_search_widget.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/custom_tile.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_search_widget.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

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

  List<String> appBarTitles = [
    'Admin\' Dashboard',
    'Jobs Portal',
    'Internships Portal',
    'Courses Portal',
    'More Options',
  ];

  @override
  Widget build(BuildContext context) {
    var jobsNotifier = Provider.of<JobsNotifier>(context);
    var internshipsNotifier = Provider.of<InternshipsNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: appBarTitles[_currentIndex],
          actions: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfilePage());
                },
                child: const SizedBox.shrink(),
              ),
            )
          ],
          child: const SizedBox.shrink(),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            UsersListWidget(),
            PostedJobsWidget(),
            PostedInternshipsWidget(),
            PostedCoursesWidget(),
            MoreOptionsWidget(),
          ],
        ),
      ),
      floatingActionButton: (_currentIndex == 0 || _currentIndex == 4)
          ? const SizedBox.shrink()
          : FloatingActionButton(
              hoverColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                if (_currentIndex == 1) {
                  Get.to(() => const AddJobsPage())
                      ?.then((value) => jobsNotifier.getJobs());
                }
                if (_currentIndex == 2) {
                  Get.to(() => const AddInternshipsPage())
                      ?.then((value) => internshipsNotifier.getInternships());
                }
                if (_currentIndex == 3) {
                  Get.to(() => const AddCoursesPage());
                }
              },
              backgroundColor: Color(kLight.value),
              child: Icon(Icons.add, color: Color(kOrange.value)),
            ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: BottomNavyBar(
          selectedIndex: _currentIndex,
          animationDuration: const Duration(milliseconds: 220),
          backgroundColor: Colors.white,
          containerHeight: 65,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          curve: Curves.easeIn,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Users',
                    style: TextStyle(color: Color(kOrange.value))),
                icon: Icon(AntDesign.user, color: Color(kOrange.value))),
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
                  'Courses',
                  style: TextStyle(color: Color(kOrange.value)),
                ),
                icon: Icon(
                  Icons.menu_book_rounded,
                  color: Color(kOrange.value),
                )),
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
      ),
    );
  }
}

class PostedCoursesWidget extends StatelessWidget {
  const PostedCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesNotifier>(builder: (context, courseNotifier, child) {
      courseNotifier.getCourses();
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
                    Get.to(() => const UsersSearchPage());
                  },
                ),
              ),
              const HeightSpacer(size: 10),
              FutureBuilder(
                  future: courseNotifier.coursesList,
                  builder: (context, coursesSnapshot) {
                    if (coursesSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const HorizontalShimmer();
                    } else if (coursesSnapshot.hasError) {
                      return Center(
                        child: Text('Error ${coursesSnapshot.error}'),
                      );
                    }
                    final courses = coursesSnapshot.data;
                    if (courses?.isEmpty ?? true) {
                      return const Center(
                        child: Text('No Courses Available In JOBSHUB'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: courses?.length,
                      itemBuilder: (context, index) {
                        final course = courses![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: CourseTile(
                            onTap: () {
                              Uri url = Uri.parse(course.webAddress);
                              LaunchURL.launchURL(url);
                            },
                            course: course,
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
      internshipsNotifier.getInternships();
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
                    Get.to(() => const UsersSearchPage());
                  },
                ),
              ),
              const HeightSpacer(size: 10),
              FutureBuilder(
                  future: internshipsNotifier.internshipsList,
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
                        child: Text('No Users Available In JOBSHUB'),
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
      jobsNotifier.getJobs();
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
                  future: jobsNotifier.jobsList,
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
                        child: Text('No Jobs Available In JOBSHUB'),
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

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersNotifier>(builder: (context, userNotifier, child) {
      userNotifier.getUsers();
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
                child: UsersSearchWidget(
                  onTap: () {
                    Get.to(() => const UsersSearchPage());
                  },
                ),
              ),
              const HeightSpacer(size: 10),
              FutureBuilder(
                  future: userNotifier.usersList,
                  builder: (context, usersSnapshot) {
                    if (usersSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const HorizontalShimmer();
                    } else if (usersSnapshot.hasError) {
                      return Center(
                        child: Text('Error ${usersSnapshot.error}'),
                      );
                    }
                    final users = usersSnapshot.data;
                    if (users?.isEmpty ?? true) {
                      return const Center(
                        child: Text('No Users Available In JOBSHUB'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: users?.length,
                      itemBuilder: (context, index) {
                        final user = users![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: UserTile(
                            onTap: () {
                              // TODO
                            },
                            user: user,
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

class MoreOptionsWidget extends StatelessWidget {
  const MoreOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Builder(builder: (context) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 15),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
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
        ),
      );
    });
  }
}
