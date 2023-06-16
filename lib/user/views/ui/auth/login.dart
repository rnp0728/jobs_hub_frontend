import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/request/auth/login_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      loginNotifier.getPrefs();
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            text: 'Log In',
            child: (loginNotifier.entrypoint && !loginNotifier.loggedIn)
                ? const SizedBox.shrink()
                : GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: loginNotifier.loginFormKey,
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                  text: 'Welcome Back',
                  style: appstyle(30, Color(kDark.value), FontWeight.w600),
                ),
                ReusableText(
                  text: 'Fill the details to login to your Account',
                  style: appstyle(16, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 50),
                CustomTextField(
                  hintText: 'Email Id',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your Email';
                    } else if (!email.contains('@')) {
                      return 'Please Enter a Valid Email';
                    }
                    return null;
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: loginNotifier.obscureText,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Please enter your Passowrd';
                    } else if (password.length < 8) {
                      return 'Pleas enter a valid Password';
                    }
                    return null;
                  },
                  maxLines: 1,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifier.obscureText = !loginNotifier.obscureText;
                      },
                      child: Icon(
                        loginNotifier.obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      )),
                ),
                const HeightSpacer(size: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => const RegistrationPage());
                      },
                      child: ReusableText(
                        text: 'Create Account',
                        style: appstyle(
                            15, Color(kDarkPurple.value), FontWeight.w500),
                      )),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  onTap: () {
                    if (loginNotifier.validateAndSave()) {
                      LoginModel model = LoginModel(
                          email: emailController.text,
                          password: passwordController.text);

                      loginNotifier.userLogin(model);
                    } else {
                      Get.snackbar(
                        'Log In Failed',
                        'Please check your Credentials',
                        colorText: Color(kLight.value),
                        backgroundColor: Colors.red,
                        icon: const Icon(Icons.add_alert),
                      );
                    }
                  },
                  text: 'Log In',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
