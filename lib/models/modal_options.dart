part of image_picker_widget;

class ModalOptions {
  final Widget? title;
  final Widget? cameraText;
  final Widget? galleryText;
  final IconData? cameraIcon;
  final IconData? galleryIcon;
  final double? cameraSize;
  final double? gallerySize;
  final Color? cameraColor;
  final Color? galleryColor;

  ModalOptions({
    this.title, 
    this.cameraText, 
    this.galleryText, 
    this.cameraIcon,
    this.galleryIcon,
    this.cameraSize,
    this.gallerySize,
    this.cameraColor,
    this.galleryColor,
  });
}