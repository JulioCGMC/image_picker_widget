part of image_picker_widget;

class CroppedImageOptions {
  final int? maxWidth;
  final int? maxHeight;
  final CropAspectRatio? aspectRatio;
  final List<CropAspectRatioPreset> aspectRatioPresets;
  final CropStyle cropStyle;
  final ImageCompressFormat compressFormat;
  final int compressQuality;
  final AndroidUiSettings? androidUiSettings;
  final IOSUiSettings? iosUiSettings;

  CroppedImageOptions({
    this.maxWidth,
    this.maxHeight,
    this.aspectRatio,
    this.aspectRatioPresets = const [CropAspectRatioPreset.original, CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9],
    this.cropStyle = CropStyle.rectangle,
    this.compressFormat = ImageCompressFormat.jpg,
    this.compressQuality = 90,
    this.androidUiSettings,
    this.iosUiSettings
  });
}