part of image_picker_widget;

/// Alters the actual image
Future<File?> changeImage(BuildContext context, Widget modal, bool shouldCrop, 
  CroppedImageOptions? croppedImageOptions, 
ImagePickerOptions? imagePickerOptions) async {
  final ImagePicker _picker = ImagePicker();
  File? response;
  ImageSource? type = await showModalBottomSheet<ImageSource?>(
      context: context, builder: (context) => modal);
  if (type != null) {
    imagePickerOptions ??= ImagePickerOptions();

    final XFile? _picked = await _picker.pickImage(source: type, 
      imageQuality: imagePickerOptions.imageQuality,
      maxHeight: imagePickerOptions.maxHeight, 
      maxWidth: imagePickerOptions.maxWidth,
      preferredCameraDevice: imagePickerOptions.preferredCameraDevice
    );
    if (_picked != null) {
      if (shouldCrop) {
        response = await cropImage(_picked, croppedImageOptions);
      }
      else {
        response = File(_picked.path);
      }
    }
  }
  return response;
}
