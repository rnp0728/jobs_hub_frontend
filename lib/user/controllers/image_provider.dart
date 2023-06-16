import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_hub/constants/app_constants.dart';
import 'package:uuid/uuid.dart';

class ImageUploader extends ChangeNotifier {
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
      cropStyle: CropStyle.circle,
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
