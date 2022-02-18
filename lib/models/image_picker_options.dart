part of image_picker_widget;

class ImagePickerOptions {
  final double? maxWidth;
  final double? maxHeight;
  final int? imageQuality;
  final CameraDevice preferredCameraDevice;

  ImagePickerOptions({
    this.maxWidth,
    this.maxHeight,
    this.imageQuality,
    this.preferredCameraDevice = CameraDevice.rear,
  });
}
