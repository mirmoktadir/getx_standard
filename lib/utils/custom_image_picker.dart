import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme/light_theme_colors.dart';

class CustomImagePicker {
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();

  /// Nullable reactive picked image
  Rxn<File> pickedImage = Rxn<File>();

  /// Pick image from gallery
  Future<File?> getImageFromGallery({
    bool canCrop = true,
    int imageQuality = 50,
    int? maxWidth,
    int? maxHeight,
  }) async {
    try {
      final xFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
        maxWidth: maxWidth?.toDouble(),
        maxHeight: maxHeight?.toDouble(),
      );
      return _handlePickedXFile(xFile,
          canCrop: canCrop, imageQuality: imageQuality);
    } catch (_) {
      return null;
    }
  }

  /// Pick image from camera
  Future<File?> getImageFromCamera({
    bool canCrop = true,
    int imageQuality = 50,
    int? maxWidth,
    int? maxHeight,
  }) async {
    try {
      final xFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: imageQuality,
        maxWidth: maxWidth?.toDouble(),
        maxHeight: maxHeight?.toDouble(),
      );
      return _handlePickedXFile(xFile,
          canCrop: canCrop, imageQuality: imageQuality);
    } catch (_) {
      return null;
    }
  }

  Future<File?> _handlePickedXFile(
    XFile? xFile, {
    required bool canCrop,
    int imageQuality = 50,
  }) async {
    if (xFile == null) return null;
    try {
      File file = File(xFile.path);
      if (canCrop) {
        final cropped = await cropImage(file, compressQuality: imageQuality);
        if (cropped != null) {
          pickedImage.value = cropped;
          return cropped;
        }
        return null;
      } else {
        pickedImage.value = file;
        return file;
      }
    } catch (_) {
      return null;
    }
  }

  /// Crop image with platform-specific UI settings
  Future<File?> cropImage(
    File imageFile, {
    int compressQuality = 50,
    ImageCompressFormat compressFormat = ImageCompressFormat.jpg,
  }) async {
    try {
      final croppedFile = await _cropper.cropImage(
        sourcePath: imageFile.path,
        compressQuality: compressQuality,
        compressFormat: compressFormat,
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
              CropAspectRatioPreset.ratio16x9
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
              CropAspectRatioPreset.ratio16x9
            ],
          ),
        ],
      );

      if (croppedFile != null) {
        imageCache.clear();
        final file = File(croppedFile.path);
        return file;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Clear picked image
  void clear() {
    pickedImage.value = null;
    imageCache.clear();
  }

  /// Get file size in MB
  double getFileSizeInMB(File file) => file.lengthSync() / (1024 * 1024);
}
