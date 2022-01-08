part of image_picker_widget;

/// Alters the actual image
Future<File?> cropImage(XFile file, CroppedImageOptions? croppedImageOptions) async {
  File? response;
  print('Aqui');
  try {
    if (croppedImageOptions == null) {
      croppedImageOptions = CroppedImageOptions();
    }
    response = await ImageCropper.cropImage(
      sourcePath: file.path,
      maxWidth: croppedImageOptions.maxWidth,
      maxHeight: croppedImageOptions.maxHeight,
      aspectRatio: croppedImageOptions.aspectRatio,
      aspectRatioPresets: croppedImageOptions.aspectRatioPresets,
      cropStyle: croppedImageOptions.cropStyle,
      compressFormat: croppedImageOptions.compressFormat,
      compressQuality: croppedImageOptions.compressQuality,
      androidUiSettings: croppedImageOptions.androidUiSettings,
      iosUiSettings: croppedImageOptions.iosUiSettings,
    );
  } catch (e) {
    response = File(file.path);
  }

  return response;
}
