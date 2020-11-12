import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ModalImageSelector extends StatelessWidget {

  final Widget modalTitle;
  final Widget modalCameraText;
  final Widget modalGalleryText;
  final IconData modalCameraIcon;
  final IconData modalGalleryIcon;

  const ModalImageSelector({
    Key key, 
    this.modalTitle,
    this.modalCameraText,
    this.modalGalleryText,
    this.modalCameraIcon,
    this.modalGalleryIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        return null;
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (_) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            modalTitle ?? Text(
              "Select:",
              style: Theme.of(context).textTheme.subtitle2
            ),
            SizedBox(height: 5),
            FractionallySizedBox(
              widthFactor: 1.2 / 2,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          modalCameraIcon ?? Icons.camera,
                          size: 40,
                          color: Theme.of(context).primaryColor
                        ),
                        modalCameraText ?? Text(
                          "camera",
                          style: Theme.of(context).textTheme.overline
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(ImageSource.gallery);
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          modalGalleryIcon ?? Icons.collections,
                          size: 40,
                          color: Theme.of(context).primaryColor
                        ),
                        modalGalleryText ?? Text(
                          "gallery",
                          style: Theme.of(context).textTheme.overline
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox()
          ],
        ),
      )
    );
  }
}
