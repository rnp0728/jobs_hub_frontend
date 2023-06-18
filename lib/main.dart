import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/controllers/my_courses_provider.dart';
import 'package:jobs_hub/admin/controllers/my_internships_provider.dart';
import 'package:jobs_hub/admin/controllers/my_jobs_provider.dart';
import 'package:jobs_hub/admin/controllers/users_provider.dart';
import 'package:jobs_hub/admin/views/admin_home_page.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:jobs_hub/recruiter/controllers/applicants_provider.dart';
import 'package:jobs_hub/recruiter/views/recruiter_screen.dart';
import 'package:jobs_hub/user/controllers/bookmark_provider.dart';
import 'package:jobs_hub/user/controllers/common_provider.dart';
import 'package:jobs_hub/user/controllers/courses_provider.dart';
import 'package:jobs_hub/user/controllers/image_provider.dart';
import 'package:jobs_hub/user/controllers/internships_provider.dart';
import 'package:jobs_hub/user/controllers/jobs_provider.dart';
import 'package:jobs_hub/user/controllers/login_provider.dart';
import 'package:jobs_hub/user/controllers/onboarding_provider.dart';
import 'package:jobs_hub/user/controllers/profile_provider.dart';
import 'package:jobs_hub/user/controllers/signup_provider.dart';
import 'package:jobs_hub/user/controllers/zoom_provider.dart';
import 'package:jobs_hub/firebase_options.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:jobs_hub/user/views/ui/common/safety_tips_page.dart';
import 'package:jobs_hub/user/views/ui/mainscreen.dart';
import 'package:jobs_hub/user/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget defaultHome = const OnBoardingScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final entrypoint = prefs.getBool('entrypoint') ?? false;

  final loggedIn = prefs.getBool('loggedIn') ?? false;

  final userType = prefs.getString('userType') ?? "user";

  if (entrypoint && !loggedIn) {
    defaultHome = const LoginPage();
  } else if (entrypoint && loggedIn) {
    if (userType == "admin") {
      defaultHome = const AdminHomePage();
    } else if (userType == "recruiter") {
      defaultHome = const RecruiterHomeScreen();
    } else {
      defaultHome = const MainScreen();
    }
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ChangeNotifierProvider(create: (context) => ZoomNotifier()),
    ChangeNotifierProvider(create: (context) => SignUpNotifier()),
    ChangeNotifierProvider(create: (context) => JobsNotifier()),
    ChangeNotifierProvider(create: (context) => InternshipsNotifier()),
    ChangeNotifierProvider(create: (context) => BookMarkNotifier()),
    ChangeNotifierProvider(create: (context) => ImageUploader()),
    ChangeNotifierProvider(create: (context) => ProfileNotifier()),
    ChangeNotifierProvider(create: (context) => CommonNotifier()),
    ChangeNotifierProvider(create: (context) => CoursesNotifier()),
    ChangeNotifierProvider(create: (context) => UsersNotifier()),
    ChangeNotifierProvider(create: (context) => MyJobsNotifier()),
    ChangeNotifierProvider(create: (context) => MyInternshipNotifier()),
    ChangeNotifierProvider(create: (context) => MyCourseNotifier()),
    ChangeNotifierProvider(create: (context) => ApplicantsNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Jobs Hub',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(kLight.value),
              iconTheme: IconThemeData(color: Color(kDark.value)),
              primarySwatch: Colors.grey,
            ),
            home:
                defaultHome, // Home page based on the users actions (if he has already visited the onboarding screen or logged in)
          );
        });
  }
}
