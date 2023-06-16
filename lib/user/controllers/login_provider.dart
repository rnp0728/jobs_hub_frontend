import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/admin/views/admin_home_page.dart';
import 'package:jobs_hub/recruiter/views/recruiter_screen.dart';
import 'package:jobs_hub/user/models/request/auth/login_model.dart';
import 'package:jobs_hub/user/models/request/auth/profile_update_model.dart';
import 'package:jobs_hub/user/services/helpers/auth_helper.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/auth/update_user.dart';
import 'package:jobs_hub/user/views/ui/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool _firstTime = true;

  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  bool? _entrypoint;

  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newValue) {
    _entrypoint = newValue;
    notifyListeners();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newValue) {
    _loggedIn = newValue;
    notifyListeners();
  }

  String? _userType;

  String get userType => _userType ?? 'user';

  set userType(String newValue) {
    _userType = newValue;
    notifyListeners();
  }

  // getting stored values
  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedIn = prefs.getBool('loggedIn') ?? false;
    userType = prefs.getString('userType') ?? "user";

    notifyListeners();
  }

  final loginFormKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = loginFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool profileValidation() {
    final form = profileFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response && firstTime) {
        Get.off(() => const PersonalDetails());
      } else if (response && !firstTime) {
        if (userType == "admin") {
          Get.off(() => const AdminHomePage());
        } else if (userType == "recruiter") {
          Get.off(() => const RecruiterHomeScreen());
        } else {
          Get.off(() => const MainScreen());
        }
      } else if (!response) {
        Get.snackbar('Log In Failed', 'Please check your Credentials',
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert));
      }
    });
  }

  logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('loggedIn', false);
    await prefs.remove('token');
    _firstTime = false;
    notifyListeners();
  }

  updateProfile(ProfileUpdateReq model) async {
    AuthHelper.updateProfile(model).then((response) {
      if (response) {
        Get.snackbar(
          "Profile Update",
          "Enjoy your search for Jobs",
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.add_alert),
        );

        Future.delayed(const Duration(seconds: 3)).then((value) {
          if (userType == "admin") {
            Get.offAll(() => const AdminHomePage());
          } else if (userType == "recruiter") {
            Get.offAll(() => const RecruiterHomeScreen());
          } else {
            Get.offAll(() => const MainScreen());
          }
        });
      } else {
        Get.snackbar(
          "Updating Failed",
          "Please try again!",
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }
}
