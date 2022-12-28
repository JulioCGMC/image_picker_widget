part of image_picker_widget;

/// Signature for a function that creates a widget the bottom sheet of the
/// image_picker_widget, in order to select the picker option, camera or gallery
typedef IndexedWidgetPickerBuilder = Widget Function(
  BuildContext context, 
  void Function(BuildContext) selectCamera, 
  void Function(BuildContext) selectGallery,
);