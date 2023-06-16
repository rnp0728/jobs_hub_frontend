import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/models/request/auth/signup_model.dart';
import 'package:jobs_hub/user/services/helpers/auth_helper.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';

class SignUpNotifier extends ChangeNotifier {
// trigger to hide and unhide the password
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

// triggered when the login button is clicked to show the loading widget
  bool _processing = false;

  bool get processing => _processing;

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

// triggered when the fist time when user login to be prompted to the update profile page
  bool _firstTime = false;

  bool get firstTime => _firstTime;

  set firstTime(bool newValue) {
    _firstTime = newValue;
    notifyListeners();
  }

  final signupFormKey = GlobalKey<FormState>();

  bool passwordValidator(String password) {
    if (password.isEmpty) return false;
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  userSignUp(SignupModel model) {
    AuthHelper.signUp(model).then((response) => {
          if (response)
            {
              Get.off(
                () => const LoginPage(),
                transition: Transition.fade,
                duration: const Duration(seconds: 2),
              )
            }
          else
            {
              Get.snackbar(
                'Sign Up Failed',
                'Please check your Credentials',
                colorText: Color(kLight.value),
                backgroundColor: Colors.red,
                icon: const Icon(Icons.add_alert),
              )
            }
        });
  }
}
