import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Alters the actual image
Future<File> changeImage(BuildContext context, Widget modal) async {
  final ImagePicker _picker = ImagePicker();
  File response;
  ImageSource type =
      await showModalBottomSheet(context: context, builder: (context) => modal);
  if (type != null) {
    final PickedFile _picked = await _picker.getImage(source: type);
    if (_picked != null) {
      response = File(_picked.path);
    }
  }
  return response;
}
