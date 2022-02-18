# image_picker_widget

[![pub package](https://img.shields.io/pub/v/image_picker_widget.svg)](https://pub.dev/packages/image_picker_widget)


A new Flutter package to integrate image_picker with a simple Flutter widget, allowing you to edit an image without any problems with design code development

| Preview | Modal image type picker |
|---------|----------|
|![First view](img/first.png "BottomNavyBar") | ![Modal image type picker](img/second.png "Fix") |

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  # Design
  image_picker_widget: '>=2.0.0 <3.0.0 
  # For pre null-safety, use version 1.0.3'
```

A Flutter plugin for iOS and Android for picking images from the image library,
and taking new pictures with the camera.

## Installation

Since this package requires `image_picker`, and `image_cropper` you need to add this requirements bellow.

### iOS

Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

* `NSPhotoLibraryUsageDescription` - describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.
* `NSCameraUsageDescription` - describe why your app needs access to the camera. This is called _Privacy - Camera Usage Description_ in the visual editor.
* `NSMicrophoneUsageDescription` - describe why your app needs access to the microphone, if you intend to record videos. This is called _Privacy - Microphone Usage Description_ in the visual editor.

### Android

#### [Image Picker](https://pub.dev/packages/image_picker#android) config:

No configuration required - the plugin should work out of the box.

It is no longer required to add android:requestLegacyExternalStorage="true" as an attribute to the <application> tag in AndroidManifest.xml, as image_picker has been updated to make use of scoped storage.

#### [Image Cropper](https://pub.dev/packages/image_cropper#android) config:

- Add UCropActivity into your AndroidManifest.xml

````xml
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
````

#### Note:
From v1.2.0, you need to migrate your android project to v2 embedding ([detail](https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects))

______________

## Parameter (Required)
| Property | Description | Type |
|-----------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------|
| `diameter` | The diameter of the container in which the image is contained. | double   |

## Parameter (Optional)
| Property | Description | Type |
|-----------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------|
| `initialImage` | The initial image to be displaied, can be an `ImageProvider`, `File` or a `external url (String)` | dynamic |
| `isEditable` | Checks whether the image can be changed | bool   |
| `shouldCrop` | defines if the image can be edited and/or croped with the defined values [bellow](#image-cropping) default to **false**. | bool   |
| `onChange` | Case the image can be changed, this function will be called after the change. | void Function(File)   |

## Customization (Optional)

### Image Picker Widget
| Property | Description | Type |
|-----------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------|
| `shape` | The shape of the widget [`square` or `circle`] | ImagePickerWidgetShape |
| `backgroundColor` | The background of the widget [default to `Colors.grey[500]`] | Color |
| `editIcon` | The widget that references the possibility of editing | Widget |

### Modal image type picker
| Property | Description | Type |
|-----------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------|
| `modalTitle` | The title of the widget [default to `Text` > "Select:"] | Widget |
| `modalCameraIcon` | The camera icon that selects the camera [default to `Icons.camera`] | IconData
IconData |
| `modalCameraText` | The camera label that indicates to selects the camera [defaults to `Text` > "camera"] | Widget |
| `modalGalleryIcon` | The gallery icon that selects the gallery [default to `Icons.collections`] | IconData
IconData |
| `modalGalleryText` | The gallery label that indicates to selects the gallery [defaults to `Text` > "gallery"] | Widget |

### Image Picker Options
| Property | Description | Type |
|-----------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------|
| `maxWidth` | If specified, the image will be at most maxWidth wide and maxHeight tall. Otherwise the image will be returned at it's original width and height. | int |
| `maxHeight` | If specified, the image will be at most maxWidth wide and maxHeight tall. Otherwise the image will be returned at it's original width and height. | int |
| `imageQuality` | The imageQuality argument modifies the quality of the image, ranging from 0-100 where 100 is the original/max quality. If imageQuality is null, the image with the original quality will be returned. Compression is only supported for certain image types such as JPEG and on Android PNG and WebP, too. If compression is not supported for the image that is picked, a warning message will be logged. | int |
| `preferredCameraDevice` | Use preferredCameraDevice to specify the camera to use when the source is [ImageSource.camera]. The preferredCameraDevice is ignored when source is [ImageSource.gallery]. It is also ignored if the chosen camera is not supported on the device. Defaults to [CameraDevice.rear]. Note that Android has no documented parameter for an intent to specify if the front or rear camera should be opened, this function is not guaranteed to work on an Android device. | CameraDevice |

### Image Cropping Options
| Property | Description | Type |
|-----------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------|
| `maxWidth` | maximum cropped image width. | int |
| `maxHeight` | maximum cropped image height. | int |
| `aspectRatio` | controls the aspect ratio of crop bounds. If this values is set, the cropper is locked and user can't change the aspect ratio of crop bounds. | CropAspectRatio |
| `aspectRatioPresets` | controls the list of aspect ratios in the crop menu view. In Android, you can set the initialized aspect ratio when starting the cropper by setting the value of `AndroidUiSettings.initAspectRatio`. | List |
| `cropStyle` | controls the style of crop bounds, it can be rectangle or circle style (default is `CropStyle.rectangle`). | CropStyle |
| `compressFormat` | the format of result image, png or jpg (default is ImageCompressFormat.jpg). | ImageCompressFormat |
| `compressQuality` | the value [0 - 100] to control the quality of image compression. | int |
| `androidUiSettings` | controls UI customization on Android. See [Android customization](https://pub.dev/packages/image_cropper#android). | AndroidUiSettings |
| `iosUiSettings` | controls UI customization on iOS. See [iOS customization](https://pub.dev/packages/image_cropper#ios). | IOSUiSettings |

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

## Issues

Please if you see any issues, bugs, or feature requests, send to me in: [GitHub issue](https://github.com/JulioCGMC/image_picker_widget/issues).