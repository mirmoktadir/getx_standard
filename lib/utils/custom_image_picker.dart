import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme/light_theme_colors.dart';

class CustomImagePicker {
  File? pickedImage;

  Future<void> getImageFromGallery({required bool canCrop}) async {
    var galleryImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (galleryImage != null) {
      if (canCrop) {
        pickedImage = await cropImage(File(galleryImage.path));
      } else {
        pickedImage = File(galleryImage.path);
      }
    }
  }

  Future<void> getImageFromCamera({required bool canCrop}) async {
    var cameraImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (cameraImage != null) {
      if (canCrop) {
        pickedImage = await cropImage(File(cameraImage.path));
      } else {
        pickedImage = File(cameraImage.path);
      }
    }
  }

  Future<File?> cropImage(File croppedImage) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: croppedImage.path,
      compressQuality: 50,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: LightThemeColors.primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
      ],
    );
    if (croppedFile != null) {
      imageCache.clear();
      return File(croppedFile.path);
    }
    return null;
  }

  double getFileSizeInMB(File file) {
    int bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }
}
