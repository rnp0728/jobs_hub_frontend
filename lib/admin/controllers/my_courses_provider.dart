import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_hub/admin/models/course_req.dart';
import 'package:jobs_hub/admin/models/internship_req.dart';
import 'package:jobs_hub/admin/services/posted_course_helper.dart';
import 'package:jobs_hub/admin/services/posted_internships_helper.dart';
import 'package:jobs_hub/admin/views/admin_home_page.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:uuid/uuid.dart';

class MyCourseNotifier extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  bool validAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool _saved = false;

  bool get saved => _saved;

  set saved(bool value) {
    _saved = value;
    notifyListeners();
  }

  addCourse({required CourseReqModel model}) {
    PostedCoursesHelper.addACourse(model).then((response) {
      if (response) {
        Get.snackbar(
          'Course Posted',
          'New Course Added to the List',
          colorText: Color(kLight.value),
          backgroundColor: Color(kDarkBlue.value),
          icon: const Icon(Icons.done),
        );
        Future.delayed(const Duration(seconds: 2)).then((value) {
          Get.offAll(() => const AdminHomePage());
        });
      } else {
        Get.snackbar(
          'Failed to Add',
          'Unable to Add a New Course',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.cancel),
        );
      }
    });
  }

  var uuid = Uuid();
  final ImagePicker _picker = ImagePicker();

  String? imageUrl;
  String? imagePath;
  List<String> imageFil = [];

  void pickImage() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

    imageFile = await cropImage(imageFile!);
    if (imageFile != null) {
      imageFil.add(imageFile.path);
      imageUpload(imageFile);
      imagePath = imageFile.path;
    } else {
      return;
    }
  }

  Future<XFile?> cropImage(XFile imageFile) async {
    // Crop the image using image_cropper package
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 800,
      maxHeight: 600,
      compressQuality: 70,
      aspectRatioPresets: [CropAspectRatioPreset.ratio5x4],
      cropStyle: CropStyle.rectangle,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'JobsHub Cropper',
            toolbarColor: Color(kLightBlue.value),
            toolbarWidgetColor: Color(kLight.value),
            initAspectRatio: CropAspectRatioPreset.ratio5x4,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'JobsHub Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      notifyListeners();
      return XFile(croppedFile.path);
    } else {
      return null;
    }
  }

  Future<String?> imageUpload(XFile upload) async {
    File image = File(upload.path);

    final ref = FirebaseStorage.instance
        .ref()
        .child('jobshub')
        .child('${uuid.v1()}jpg');
    await ref.putFile(image);
    imageUrl = await ref.getDownloadURL();
    print(imageUrl);
    return imageUrl;
  }
}
