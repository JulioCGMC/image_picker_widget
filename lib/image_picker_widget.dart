library image_picker_widget;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_widget/components/modal_image_selector.dart';
import 'package:image_picker_widget/functions/change_image.dart';

import 'enum/image_picker_widget_shape.dart';

class ImagePickerWidget extends StatefulWidget {
  /// The diameter of the container in which the image is contained
  final double diameter;

  /// The shape of the widget [square or circle]
  final ImagePickerWidgetShape shape;

  /// The initial image to be displaied, can be an `ImageProvider`, 
  /// `File` or a `external url (String)`
  final dynamic initialImage;

  /// Checks whether the image can be changed
  final bool isEditable;

  /// Case the image can be changed, this function will be called after the change
  final void Function(File) onChange;
  final Color backgroundColor;
  final Widget editIcon;
  final Widget modalTitle;
  final Widget modalCameraText;
  final Widget modalGalleryText;
  final IconData modalCameraIcon;
  final IconData modalGalleryIcon;

  const ImagePickerWidget(
      {Key key,
      @required this.diameter,
      this.initialImage,
      this.isEditable = false,
      this.onChange,
      this.backgroundColor,
      this.shape = ImagePickerWidgetShape.circle,
      this.editIcon,
      this.modalTitle,
      this.modalCameraText,
      this.modalGalleryText,
      this.modalCameraIcon,
      this.modalGalleryIcon})
      : assert(
        (initialImage is String || initialImage is File || initialImage is ImageProvider),
        'initialImage must be an String, ImageProvider, or File'
      ), super(key: key);

  @override
  _ImagePickerWidgetState createState() =>
      _ImagePickerWidgetState(this.initialImage);
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  dynamic image;

  _ImagePickerWidgetState(this.image);

  @override
  Widget build(BuildContext context) {
    return _editMode(
        child: Container(
      width: widget.diameter,
      height: widget.diameter,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.grey[500],
          borderRadius: BorderRadius.all(
              (widget.shape == ImagePickerWidgetShape.circle
                  ? Radius.circular(999)
                  : Radius.circular(8))),
          image: _image()),
    ));
  }

  Widget _editMode({@required Widget child}) {
    if (widget.isEditable)
      return GestureDetector(
        onTap: () {
          changeImage(
                  context,
                  ModalImageSelector(
                      modalTitle: widget.modalTitle,
                      modalCameraText: widget.modalCameraText,
                      modalGalleryText: widget.modalGalleryText,
                      modalCameraIcon: widget.modalCameraIcon,
                      modalGalleryIcon: widget.modalGalleryIcon))
              .then((file) {
            if (file != null) {
              widget.onChange(file);
              setState(() {
                image = file;
              });
            }
          });
        },
        child: Container(
          width: widget.diameter,
          height: widget.diameter,
          child: Stack(
            children: [
              child,
              Align(
                alignment: Alignment.bottomLeft,
                child: widget.editIcon ??
                    Card(
                      shape: CircleBorder(),
                      color: Colors.grey[700],
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.edit, size: 22, color: Colors.white),
                      ),
                    ),
              )
            ],
          ),
        ),
      );
    return child;
  }

  /// Analysis if the image is a `File`, an external `url` or null
  DecorationImage _image() {
    if (image is ImageProvider) {
      return DecorationImage(image: image, fit: BoxFit.cover);
    }
    if (image is File)
      return DecorationImage(image: FileImage(image), fit: BoxFit.cover);
    else if (image != null)
      return DecorationImage(image: NetworkImage(image), fit: BoxFit.cover);
    return null;
  }
}
