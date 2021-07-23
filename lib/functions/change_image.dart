part of image_picker_widget;

/// Alters the actual image
Future<File?> changeImage(BuildContext context, Widget modal) async {
  final ImagePicker _picker = ImagePicker();
  File? response;
  ImageSource? type = await showModalBottomSheet<ImageSource?>(
      context: context, builder: (context) => modal);
  if (type != null) {
    final PickedFile? _picked = await _picker.getImage(source: type);
    if (_picked != null) {
      response = File(_picked.path);
    }
  }
  return response;
}
