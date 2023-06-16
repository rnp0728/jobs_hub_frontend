import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_screen.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/auth/profile.dart';
import 'package:jobs_hub/user/views/ui/bookmarks/bookmarks.dart';
import 'package:jobs_hub/user/views/ui/chat/chatpage.dart';
import 'package:jobs_hub/user/views/ui/device_mgt/devices_info.dart';
import 'package:jobs_hub/user/views/ui/homepage.dart';
import 'package:jobs_hub/user/views/ui/internships/internship_list_page.dart';
import 'package:jobs_hub/user/views/ui/jobs/jobs_list_page.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return ZoomDrawer(
        menuScreen: DrawerScreen(
          indexSetter: (index) {
            zoomNotifier.currentIndex = index;
          },
        ),
        mainScreen: currentScreen(),
        borderRadius: 30,
        showShadow: true,
        angle: 0.0,
        slideWidth: 250,
        menuBackgroundColor: Color(kLightBlue.value),
      );
    });
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const JobsListPage();
      case 2:
        return const InternshipsListPage();
      case 3:
        return const ChatsPage();
      case 4:
        return const BookMarkPage();
      case 5:
        return const DeviceManagement();
      case 6:
        return const ProfilePage();
      default:
        return const Placeholder();
    }
  }
}
