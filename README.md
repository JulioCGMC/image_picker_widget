# image_picker_widget

A new Flutter package to integrate image_picker with a simple Flutter widget, allowing you to edit an image without any problems with design code development

| Preview | Modal image type picker |
|---------|----------|
|![First view](img/first.png "BottomNavyBar") | ![Modal image type picker](img/second.png "Fix") |

## Parameter (Required)
-  `diameter` - The diameter of the container in which the image is contained.

## Parameter (Optional)
- `initialImage` - The initial image to be displaied, can be a  `File` or a external url (`String`)
- `isEditable` - Checks whether the image can be changed
- `onChange` - Case the image can be changed, this function will be called after the change.

## Customization (Optional)

### Image Picker Widget
- `shape` - The shape of the widget [`square` or `circle`]
- `backgroundColor` - The background of the widget [default to `Colors.grey[500]`]
- `editIcon` - The widget that references the possibility of editing

### Modal image type picker
- `modalTitle` - The title of the widget [default to `Text` > "Select:"]
- `modalCameraIcon` - The camera icon that selects the camera [default to `Icons.camera`]
- `modalCameraText` - The camera label that indicates to selects the camera [defaults to `Text` > "camera"]
- `modalGalleryIcon` - The gallery icon that selects the gallery [default to `Icons.collections`]
- `modalGalleryText` - The gallery label that indicates to selects the gallery [defaults to `Text` > "gallery"]

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  # Design
  image_picker_widget: ^1.0.1
```

## Basic Usage

Adding the widget

```dart
..child: ImagePickerWidget(
    diameter: 180,
    // initialImage: "https://strattonapps.com/wp-content/uploads/2020/02/flutter-logo-5086DD11C5-seeklogo.com_.png",
    shape: ImagePickerWidgetShape.circle, // ImagePickerWidgetShape.square
    isEditable: true,
    onChange: (File file) {
        print("I changed the file to: ${file.path}");
    },
)
```