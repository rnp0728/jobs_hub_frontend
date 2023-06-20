import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:jobs_hub/launch_urls.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/heading_widget.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/profile.dart';

class RecommandedSitesPage extends StatefulWidget {
  const RecommandedSitesPage({super.key});

  @override
  State<RecommandedSitesPage> createState() => _RecommandedSitesPageState();
}

class _RecommandedSitesPageState extends State<RecommandedSitesPage> {
  List<Map<String, dynamic>> commonSites = [
    {
      'url': 'https://www.google.com',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.czcONoMPCHr1xruSOrx2HgHaHj&pid=Api&rs=1&c=1&qlt=95&w=113&h=115',
      'name': 'Google'
    },
    {
      'url': 'https://www.stackoverflow.com',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.cdT1okylnJkiQ3krgSccYgHaFj&pid=Api&P=0&h=180',
      'name': 'StackOverflow'
    },
  ];

  List<Map<String, dynamic>> aiSites = [
    {
      'url': 'https://chat.openai.com',
      'imageUrl':
          'https://i0.wp.com/siliconspectra.com/wp-content/uploads/2019/10/openaiavatar-157199738284lcp.png?fit=408%2C408&ssl=1',
      'name': 'ChatGPT'
    },
    {
      'url': 'https://www.tensorflow.org',
      'imageUrl':
          'https://i1.wp.com/albertfattal.com/wp-content/uploads/2018/03/Tensorflow_logo.svg.png?ssl=1',
      'name': 'TensorFlow'
    },
  ];

  List<Map<String, dynamic>> studySites = [
    {
      'url': 'https://www.coursera.org/',
      'imageUrl':
          'https://tse3.mm.bing.net/th?id=OIP.AvjdR1puwX7cxCZnkwccBAHaHa&pid=Api&P=0&h=180',
      'name': 'Coursera'
    },
    {
      'url': 'https://www.udemy.com/',
      'imageUrl':
          'https://tse3.mm.bing.net/th?id=OIP.34RxlakTZoSI7KQm0jQIsQAAAA&pid=Api&P=0&h=180',
      'name': 'Udemy'
    },
    {
      'url': 'https://www.edx.org/',
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.rXwD_N5oXGStnOM3FM8cvAHaEK&pid=Api&P=0&h=180',
      'name': 'EdX'
    },
    {
      'url': 'https://www.linkedin.com/learning/',
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.Sd5xgOKeOK_fqghqYBEhZAHaHa&pid=Api&P=0&h=180',
      'name': 'LinkedIn Learning'
    },
    {
      'url': 'https://www.codecademy.com/',
      'imageUrl':
          'https://tse3.mm.bing.net/th?id=OIP.Ory7f8FaEYlLrG7tO6IAIQHaD8&pid=Api&P=0&h=180',
      'name': 'Codecademy'
    },
  ];

  List<Map<String, dynamic>> careerSites = [
    // {
    //   'url': 'https://www.indeed.com/',
    //   'imageUrl':
    //       'https://tse1.mm.bing.net/th?id=OIP.umYxa63X6HJgGTTBhHKGEQHaB6&pid=Api&P=0&h=180',
    //   'name': 'Indeed'
    // },
    {
      'url': 'https://www.naukri.com/',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.ib-u_4WShBJ1NTgVKvYaLgHaBd&pid=Api&P=0&h=180',
      'name': 'Naukri.com'
    },
    {
      'url': 'https://www.internshala.com/',
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.ZJGV8evQ6b4ChDpetz0UdAAAAA&pid=Api&P=0&h=180',
      'name': 'Internshala'
    },
    {
      'url': 'https://www.linkedin.com/jobs/',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/150px-LinkedIn_logo_initials.png',
      'name': 'LinkedIn Jobs'
    },
    {
      'url': 'https://www.glassdoor.com/Job/index.htm',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.fVNl1VDbLd8SelsWhdUwHAHaBe&pid=Api&rs=1&c=1&qlt=95&w=616&h=122',
      'name': 'Glassdoor'
    },
    {
      'url': 'https://www.careerbuilder.com/',
      'imageUrl':
          'https://tse3.mm.bing.net/th?id=OIP.3M3xtC5O0qi7sOw4cyepiQHaAy&pid=Api&P=0&h=180',
      'name': 'CareerBuilder'
    },
    {
      'url': 'https://www.simplyhired.com/',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.46Sjd0g41nb6z-Cebap17gHaCv&pid=Api&P=0&h=180',
      'name': 'SimplyHired'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Recommanded Sites to Visit",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              const HeadingWidget(text: 'Common Sites to Clear doubts'),
              const HeightSpacer(size: 10),
              SizedBox(
                height: height * 0.11,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Uri uri = Uri.parse(commonSites[index]['url']);
                          LaunchURL.launchURL(uri);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Color(kOrange.value),
                          color: Color(kLight.value),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            height: 100,
                            width: width * 0.5,
                            child: Column(
                              children: [
                                Image.network(commonSites[index]['imageUrl'],
                                    height: 40),
                                const HeightSpacer(size: 8),
                                Text(commonSites[index]['name']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: commonSites.length),
              ),
              const HeightSpacer(size: 10),
              const HeadingWidget(text: 'AI Sites'),
              const HeightSpacer(size: 10),
              SizedBox(
                height: height * 0.11,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Uri uri = Uri.parse(aiSites[index]['url']);
                          LaunchURL.launchURL(uri);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Color(kOrange.value),
                          color: Color(kLight.value),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            height: 100,
                            width: width * 0.5,
                            child: Column(
                              children: [
                                Image.network(
                                  aiSites[index]['imageUrl'],
                                  height: 40,
                                ),
                                const HeightSpacer(size: 8),
                                Text(aiSites[index]['name']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: commonSites.length),
              ),
              const HeightSpacer(size: 10),
              const HeadingWidget(text: 'Online Education Portal'),
              const HeightSpacer(size: 10),
              SizedBox(
                height: height * 0.11,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Uri uri = Uri.parse(studySites[index]['url']);
                          LaunchURL.launchURL(uri);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Color(kOrange.value),
                          color: Color(kLight.value),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            height: 100,
                            width: width * 0.5,
                            child: Column(
                              children: [
                                Image.network(studySites[index]['imageUrl'],
                                    height: 40),
                                const HeightSpacer(size: 8),
                                Text(studySites[index]['name']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: studySites.length),
              ),
              const HeightSpacer(size: 10),
              const HeadingWidget(text: 'Online Jobs Protal Like Us'),
              const HeightSpacer(size: 10),
              SizedBox(
                height: height * 0.15,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Uri uri = Uri.parse(careerSites[index]['url']);
                          LaunchURL.launchURL(uri);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Color(kOrange.value),
                          color: Color(kLight.value),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            height: 150,
                            width: width * 0.5,
                            child: Column(
                              children: [
                                const HeightSpacer(size: 15),
                                Image.network(careerSites[index]['imageUrl'],
                                    height: 40),
                                const HeightSpacer(size: 15),
                                Text(careerSites[index]['name']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: careerSites.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
