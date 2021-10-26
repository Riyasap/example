//TODO Image Picker

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// class ImagePick {
//   XFile? _imageFileList;
//
//   set _imageFile(XFile? value) {
//     _imageFileList = (value == null ? null : [value]) as XFile?;
//   }
//   final ImagePicker _picker = ImagePicker();
//   Future<void> _displayPickImageDialog(
//       BuildContext context, OnPickImageCallback onPick) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Add optional parameters'),
//             content: Column(
//               children: <Widget>[
//                 TextField(
//                   controller: maxWidthController,
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                   decoration:
//                   InputDecoration(hintText: "Enter maxWidth if desired"),
//                 ),
//                 TextField(
//                   controller: maxHeightController,
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                   decoration:
//                   InputDecoration(hintText: "Enter maxHeight if desired"),
//                 ),
//                 TextField(
//                   controller: qualityController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                   InputDecoration(hintText: "Enter quality if desired"),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                   child: const Text('PICK'),
//                   onPressed: () {
//                     double? width = maxWidthController.text.isNotEmpty
//                         ? double.parse(maxWidthController.text)
//                         : null;
//                     double? height = maxHeightController.text.isNotEmpty
//                         ? double.parse(maxHeightController.text)
//                         : null;
//                     int? quality = qualityController.text.isNotEmpty
//                         ? int.parse(qualityController.text)
//                         : null;
//                     onPick(width, height, quality);
//                     Navigator.of(context).pop();
//                   }),
//             ],
//           );
//         });}}
//
//   void _onImageButtonPressed(ImageSource source,
//       {BuildContext? context, bool isMultiImage = false}) async {
//       await _displayPickImageDialog(context!,
//               (double? maxWidth, double? maxHeight, int? quality) async {
//             try {
//               final pickedFile = await _picker.pickImage(
//                 source: source,
//                 maxWidth: maxWidth,
//                 maxHeight: maxHeight,
//                 imageQuality: quality,
//               );
//               setState(() {
//                 _imageFile = pickedFile;
//               });
//             } catch (e) {
//               setState(() {
//                 _pickImageError = e;
//               });
//             }
//           });
//
//   }
//
//
// }

class FilePick {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? fileName;
  String? _saveAsFileName;
  PlatformFile? paths;
  String? directoryPath;
  String? _extension;
  bool isLoading = false;
  bool _userAborted = false;
  TextEditingController _controller = TextEditingController();

  // void initState() {
  //   super.initState();
  //   _controller.addListener(() => _extension = _controller.text);
  // }


  void pickFiles() async {
    _resetState();
    try {
      directoryPath = null;
      paths = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
      ))
          ?.files as PlatformFile?;
      pathf = paths;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
      isLoading = false;
      if (paths != null) {
        fileName = paths!.path.toString();
      } else {
        fileName = '...';
      }
      _userAborted = paths == null;
  }
  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  void _resetState() {
      isLoading = true;
      directoryPath = null;
      fileName = null;
      paths = null;
      _saveAsFileName = null;
      _userAborted = false;
  }
  late final pathf;
}

