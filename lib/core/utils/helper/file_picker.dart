//TODO Image Picker

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePick extends StatefulWidget {
  const FilePick({Key? key}) : super(key: key);

  @override
  _FilePickState createState() => _FilePickState();
}

class _FilePickState extends State<FilePick> {
  FileType _pickingType = FileType.image;
  String? _fileName;
  String? _saveAsFileName;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

