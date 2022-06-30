part of image_picker_widget;

/// Alters the actual image
Future<File?> cropImage(XFile file, CroppedImageOptions? croppedImageOptions) async {
  File? response;
  try {
    if (croppedImageOptions == null) {
      croppedImageOptions = CroppedImageOptions();
    }
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      maxWidth: croppedImageOptions.maxWidth,
      maxHeight: croppedImageOptions.maxHeight,
      aspectRatio: croppedImageOptions.aspectRatio,
      aspectRatioPresets: croppedImageOptions.aspectRatioPresets,
      cropStyle: croppedImageOptions.cropStyle,
      compressFormat: croppedImageOptions.compressFormat,
      compressQuality: croppedImageOptions.compressQuality,
      uiSettings: [
        croppedImageOptions.androidUiSettings,
        croppedImageOptions.iosUiSettings
      ].where((w) => w != null).toList().cast<PlatformUiSettings>(),
      // androidUiSettings: croppedImageOptions.androidUiSettings,
      // iosUiSettings: croppedImageOptions.iosUiSettings,
    );
    if (croppedFile != null) {
      response = File(croppedFile.path);
    }
  } catch (e) {
    response = File(file.path);
  }

  return response;
}
