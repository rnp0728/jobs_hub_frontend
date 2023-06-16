import 'dart:developer';

import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailService {
  static Future<bool> sendEmail(
      {required String subject,
      required String content,
      required String reciever}) async {
    final Email email = Email(
      subject: subject,
      body: content,
      recipients: [reciever],
      cc: ['jobs.hub.work@gmail.com'],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> sendEmailWithAttachMent(
      {required String subject,
      required String content,
      required String reciever,
      required String attachmentPath}) async {
    final Email email = Email(
        subject: subject,
        body: content,
        recipients: [reciever],
        cc: ['jobs.hub.work@gmail.com'],
        attachmentPaths: [attachmentPath],
        isHTML: false);
    try {
      await FlutterEmailSender.send(email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
