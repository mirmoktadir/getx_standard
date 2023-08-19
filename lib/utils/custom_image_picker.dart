import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'dart:io';

import '../config/theme/light_theme_colors.dart';

class CustomImagePicker {
  Rx<File?> pickedImage = Rx<File?>(null);

  /// Pick Image
  Future getImage() async {
    var galleryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (galleryImage != null) {
      pickedImage.value = cropImage(File(galleryImage.path));
      // pickedImage.value = File(galleryImage.path);   "If don't want to use cropped image"
    }
  }

  /// Crop Image
  cropImage(File croppedImage) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: croppedImage.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.circle,
      compressQuality: 100,
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: LightThemeColors.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      imageCache.clear();
      pickedImage.value = File(croppedFile.path);
    }
  }
}
// TODO: How to use ?
// * make instance in any controller
// * final customImagePicker = CustomImagePicker();
// * use this instance from controller to UI , you can get the image example: "controller.customImagePicker.pickedImage.value"
