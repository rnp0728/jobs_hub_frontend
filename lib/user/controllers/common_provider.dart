import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_hub/launch_urls.dart';
import 'package:jobs_hub/user/services/helpers/apply_now_helper.dart';
import 'package:jobs_hub/user/services/helpers/auth_helper.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/apply_now/services/email_service.dart';
import 'package:jobs_hub/user/views/ui/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonNotifier extends ChangeNotifier {
  updatePassword(
      {required String currentPassword, required String newPassword}) {
    AuthHelper.updatePassword(
            currentPassword: currentPassword, newPassword: newPassword)
        .then((response) async {
      if (response) {
        Get.snackbar(
          'Password Updated',
          'Password Updated Successfully',
          colorText: Color(kLight.value),
          backgroundColor: Colors.deepPurple,
          icon: const Icon(Icons.approval_outlined),
        );
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setBool('loggedIn', false);
        await prefs.remove('token');
        Future.delayed(const Duration(seconds: 2)).then((value) {
          Get.offAll(() => const LoginPage());
        });
      } else {
        Get.snackbar(
          'Error Occured',
          'Please try again with Correct Credentials',
          colorText: Color(kLight.value),
          backgroundColor: Colors.deepPurple,
          icon: const Icon(Icons.approval_outlined),
        );
      }
    });
  }

  applyNow({
    required String? job,
    required String? internship,
    required String user,
    required String agentId,
  }) {
    ApplyNowHelper.applyNow(
            job: job, internship: internship, user: user, agentId: agentId)
        .then((response) {
      if (response) {
        log('Applied');
      } else {
        log('Failed');
      }
    });
  }

  sendEmail(
      {required String subject,
      required String content,
      required String reciever}) {
    EmailService.sendEmail(
            subject: subject, content: content, reciever: reciever)
        .then((response) {
      if (response) {
        Get.snackbar(
          'Email Sent',
          'Mail sent Successfully',
          colorText: Color(kLight.value),
          backgroundColor: Colors.green,
          icon: const Icon(Icons.approval_outlined),
        );
      } else {
        Get.snackbar(
          'Unable to send email',
          'Please try again!',
          colorText: Color(kLight.value),
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }

  launchUrl({required Uri uri}) {
    LaunchURL.launchURL(uri);
  }
}
