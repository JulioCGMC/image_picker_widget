part of image_picker_widget;

/// Alters the actual image
Future<File?> changeImage(BuildContext context, Widget modal, bool shouldCrop, 
CroppedImageOptions? croppedImageOptions) async {
  final ImagePicker _picker = ImagePicker();
  File? response;
  ImageSource? type = await showModalBottomSheet<ImageSource?>(
      context: context, builder: (context) => modal);
  if (type != null) {
    final XFile? _picked = await _picker.pickImage(source: type);
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
