import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/user/controllers/exports.dart';
import 'package:jobs_hub/user/models/request/auth/signup_model.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/custom_btn.dart';
import 'package:jobs_hub/user/views/common/custom_textfield.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/common/height_spacer.dart';
import 'package:jobs_hub/user/views/common/width_spacer.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool recuiter = false;
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(
      context,
    );
    return Consumer<SignUpNotifier>(builder: (context, signUpNotifier, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            text: 'Sign Up',
            child: GestureDetector(
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
            key: signUpNotifier.signupFormKey,
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                  text: 'Hello, Welcome',
                  style: appstyle(30, Color(kDark.value), FontWeight.w600),
                ),
                ReusableText(
                  text: 'Fill the details to sign up for an Account',
                  style: appstyle(16, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 50),
                CustomTextField(
                  hintText: 'Name',
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Please enter your Name !!!';
                    }
                    return null;
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your Email Address';
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
                  obscureText: signUpNotifier.obscureText,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Please enter your Passowrd';
                    } else if (password.length < 8) {
                      return 'Enter a password of length atleast 8';
                    }
                    return null;
                  },
                  maxLines: 1,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        signUpNotifier.obscureText =
                            !signUpNotifier.obscureText;
                      },
                      child: Icon(
                        signUpNotifier.obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      )),
                ),
                const HeightSpacer(size: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: recuiter,
                        onChanged: (value) {
                          setState(() {
                            recuiter = value ?? false;
                          });
                        }),
                    const WidthSpacer(width: 10),
                    ReusableText(
                        text: 'Sign Up as a Recuiter',
                        style: appstyle(
                            15, Color(kDarkBlue.value), FontWeight.w600))
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => const LoginPage());
                      },
                      child: ReusableText(
                        text: 'Log In',
                        style: appstyle(
                            15, Color(kDarkPurple.value), FontWeight.w500),
                      )),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  text: 'Create Account',
                  onTap: () {
                    if (signUpNotifier.validateAndSave()) {
                      loginNotifier.firstTime = !loginNotifier.firstTime;
                      SignupModel model = SignupModel(
                          username: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          isAgent: recuiter,
                          userType: recuiter == true ? 'recruiter' : 'user');

                      signUpNotifier.userSignUp(model);
                    } else {
                      Get.snackbar(
                          'SignUp Failed', 'Please check your Credentials',
                          colorText: Color(kLight.value),
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.add_alert));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
