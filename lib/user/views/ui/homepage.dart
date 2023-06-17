import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/widgets/course_tile.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:jobs_hub/launch_urls.dart';
import 'package:jobs_hub/user/controllers/courses_provider.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/controllers/internships_provider.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/app_style.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/search.dart';
import 'package:jobs_hub/user/views/common/vertical_shimmer.dart';
import 'package:jobs_hub/user/views/common/vertical_tile.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:jobs_hub/user/views/ui/auth/profile.dart';
import 'package:jobs_hub/user/views/ui/common/about_page.dart';
import 'package:jobs_hub/user/views/ui/common/privacy_policy_page.dart';
import 'package:jobs_hub/user/views/ui/common/safety_tips_page.dart';
import 'package:jobs_hub/user/views/ui/common/terms_conditions_page.dart';
import 'package:jobs_hub/user/views/ui/common/update_password_page.dart';
import 'package:jobs_hub/user/views/ui/courses/custom_course_widget.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_list_page.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_page.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/custom_internship_tile.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/horizontal_tile.dart';
import 'package:jobs_hub/user/views/ui/internships/widgets/internship_search_widget.dart';
import 'package:jobs_hub/user/views/ui/jobs/job_page.dart';
import 'package:jobs_hub/user/views/ui/jobs/jobs_list.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/custom_tile.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/horizontal_tile.dart';
import 'package:jobs_hub/user/views/ui/jobs/widgets/job_search_widget.dart';
import 'package:jobs_hub/user/views/ui/search/searchpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List<String> appBarTitle = [
    'Home',
    'Jobs',
    'Internships',
    'Trending Courses',
    'More Options'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: appBarTitle[_currentIndex],
          actions: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfilePage());
                },
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
              ),
            )
          ],
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            HomeWidget(),
            JobsWidget(),
            InternshipsWidget(),
            CoursesListWidget(),
            MoreOptionsWidget(),
          ],
        ),
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
                title:
                    Text('Home', style: TextStyle(color: Color(kOrange.value))),
                icon: Icon(AntDesign.home, color: Color(kOrange.value))),
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
        ),
      );
    });
  }
}

class InternshipsWidget extends StatelessWidget {
  const InternshipsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var internshipsNotifier = Provider.of<InternshipsNotifier>(context);
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
                      Get.to(() => const SearchPage());
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
                          child: Text('No Internships Available Right Now'),
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
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: CustomInternshipTile(
                              onTap: () {
                                Get.to(
                                  () => InternshipPage(
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
        ),
      );
    });
  }
}

class JobsWidget extends StatelessWidget {
  const JobsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var jobsNotifier = Provider.of<JobsNotifier>(context);
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
                      Get.to(() => const SearchPage());
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
                          child: Text('No Jobs Available Right Now'),
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
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: CustomTile(
                              onTap: () {
                                Get.to(
                                  () => JobPage(
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
        ),
      );
    });
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(builder: (context, jobsNotifier, child) {
      jobsNotifier.getJobs();
      jobsNotifier.getRecentJobs();
      return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              Text(
                "Search \nFind & Apply",
                style: appstyle(34, Color(kDark.value), FontWeight.bold),
              ),
              const HeightSpacer(size: 30),
              SearchWidget(
                onTap: () {
                  Get.to(() => const SearchPage());
                },
              ),
              const HeightSpacer(size: 30),
              HeadingWidget(
                text: "Popular Jobs",
                showButton: true,
                onTap: () {
                  Get.to(() => const JobListPage());
                },
              ),
              const HeightSpacer(size: 15),
              SizedBox(
                height: height * 0.27,
                child: FutureBuilder(
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
                          child: Text('No Jobs Available Right Now'),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobs?.length,
                        itemBuilder: (context, index) {
                          final job = jobs![index];
                          return JobHorizontalTile(
                            onTap: () {
                              Get.to(
                                () => JobPage(
                                  id: job.id,
                                  title: job.company,
                                ),
                              );
                            },
                            job: job,
                          );
                        },
                      );
                    }),
              ),
              const HeightSpacer(size: 20),
              HeadingWidget(
                text: "Recently Posted",
                onTap: () {},
              ),
              const HeightSpacer(size: 20),
              FutureBuilder(
                future: jobsNotifier.recentJob,
                builder: (context, jobsSnapshot) {
                  if (jobsSnapshot.connectionState == ConnectionState.waiting) {
                    return const VerticalShimmer();
                  } else if (jobsSnapshot.hasError) {
                    return Center(
                      child: Text('Error ${jobsSnapshot.error}'),
                    );
                  }
                  final job = jobsSnapshot.data;
                  if (job == null) {
                    return const Center(
                      child: Text('No Recents Available'),
                    );
                  }
                  return VerticalTile(
                      onTap: () {
                        Get.to(
                          () => JobPage(
                            id: job.id,
                            title: job.company,
                          ),
                        );
                      },
                      job: job);
                },
              ),
              const HeightSpacer(size: 30),
              HeadingWidget(
                text: "Popular Internships",
                showButton: true,
                onTap: () {
                  Get.to(() => const InternshipsListPage());
                },
              ),
              const HeightSpacer(size: 15),
              Consumer<InternshipsNotifier>(
                  builder: (context, internshipsNotifier, child) {
                internshipsNotifier.getInternships();
                return SizedBox(
                  height: height * 0.27,
                  child: FutureBuilder(
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
                            child: Text('No Internships Available Right Now'),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: internships?.length,
                          itemBuilder: (context, index) {
                            final internship = internships![index];
                            return InternshipHorizontalTile(
                              onTap: () {
                                Get.to(
                                  () => InternshipPage(
                                    id: internship.id,
                                    title: internship.company,
                                  ),
                                );
                              },
                              internship: internship,
                            );
                          },
                        );
                      }),
                );
              }),
              const HeightSpacer(size: 20),
              HeadingWidget(
                text: "Trending Courses",
                showButton: true,
                onTap: () {
                  Get.to(() => const InternshipsListPage());
                },
              ),
              Consumer<CoursesNotifier>(
                  builder: (context, coursesNotifier, child) {
                coursesNotifier.getCourses();
                return SizedBox(
                  height: height * 0.35,
                  child: FutureBuilder(
                      future: coursesNotifier.coursesList,
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
                            child: Text('No Courses Available Right Now'),
                          );
                        }
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: courses!.length,
                            itemBuilder: (context, index) {
                              final course = courses[index];
                              return CourseWidget(
                                onTap: () {
                                  // Get.to(() => InternshipsListPage());
                                  Uri uri = Uri.parse(course.webAddress);
                                  LaunchURL.launchURL(uri);
                                },
                                title: course.title,
                                instructor: course.instructor,
                                rating: double.parse(course.rating.toString()),
                                price: course.price,
                                imageUrl: course.imageUrl,
                                availableIn: course.availableIn,
                              );
                            });
                      }),
                );
              })
            ],
          ),
        ),
      ));
    });
  }
}

class CoursesListWidget extends StatelessWidget {
  const CoursesListWidget({super.key});

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
