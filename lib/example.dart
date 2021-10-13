import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:file_picker/file_picker.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _fileName;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }


  void _pickFiles() async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
      pathf = _paths;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
      _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
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
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }
  late final pathf;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(title: Text("Example"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),color: Color(0xFF1C1C1C),),
                margin: EdgeInsets.only(left: 24,right: 24,top: 24),
                width: 350,
                height: 163,
                padding: EdgeInsets.all(.5),
                child: DottedBorder(
                  color: Color(0xFF717171),
                  dashPattern: [20,10],
                  radius: Radius.circular(16),
                  borderType:BorderType.RRect,
                  strokeWidth: 1.5,
                  child:_isLoading
                  ?Center(
                    child: Container(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(
                            0x2251DCFC)) ),
                        onPressed:
                              () => _pickFiles(),
                        child: Center(child: Text("Click to Upload",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  )
                      :Builder(
                    builder: (BuildContext context) => _isLoading
                        ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const CircularProgressIndicator(),
                    )
                        : _userAborted
                        ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const Text(
                        'User has aborted the dialog',
                      ),
                    )
                        : _directoryPath != null
                        ? ListTile(
                      title: const Text('Directory path'),
                      subtitle: Text(_directoryPath!),
                    )
                        : _paths != null
                        ? Container(
                      padding:
                      const EdgeInsets.only(bottom: 30.0),
                      height:
                      MediaQuery.of(context).size.height *
                          0.50,
                      child: ListView.separated(
                        itemCount: _paths != null &&
                            _paths!.isNotEmpty
                            ? _paths!.length
                            : 1,
                        itemBuilder: (BuildContext context,
                            int index) {
                          final bool isMultiPath =
                              _paths != null &&
                                  _paths!.isNotEmpty;
                          final String name =
                              'File $index: ' +
                                  (isMultiPath
                                      ? _paths!
                                      .map((e) => e.name)
                                      .toList()[index]
                                      : _fileName ?? '...');
                          final path = _paths!
                              .map((e) => e.path)
                              .toList()[index]
                              .toString();

                          return Expanded(
                            child: PDFView(
                              filePath: path,
                              enableSwipe: true,
                              swipeHorizontal: true,
                              autoSpacing: false,
                              pageFling: false,

                              onError: (error) {
                                print(error.toString());
                              },
                              onPageError: (page, error) {
                                print('$page: ${error.toString()}');
                              },

                            ),
                          );
                        },
                        separatorBuilder:
                            (BuildContext context,
                            int index) =>
                        const Divider(),
                      ),
                    )
                        : _saveAsFileName != null
                        ? ListTile(
                      title: const Text('Save file'),
                      subtitle: Text(_saveAsFileName!),
                    )
                        : const SizedBox(),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: DropdownButton<FileType>(
                    hint: const Text('LOAD PATH FROM'),
                    value: _pickingType,
                    items: FileType.values
                        .map((fileType) => DropdownMenuItem<FileType>(
                      child: Text(fileType.toString()),
                      value: fileType,
                    ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      _pickingType = value!;
                      if (_pickingType != FileType.custom) {
                        _controller.text = _extension = '';
                      }
                    })),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 100.0),
                child: _pickingType == FileType.custom
                    ? TextFormField(
                  maxLength: 15,
                  autovalidateMode: AutovalidateMode.always,
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'File extension',
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                )
                    : const SizedBox(),
              ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
        child:
            ElevatedButton(
              onPressed: () => _pickFiles(),
              child: Text(_multiPick ? 'Pick files' : 'Pick file'),
            ),),


            ],
          ),
        ),
      ),
    );
  }
}
