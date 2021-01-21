import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
import './colour_picker_widget.dart';
import 'dart:io';
import 'dart:async';

void main() => runApp(LaetusApp());

class LaetusApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LaetusAppState();
  }
}

class _LaetusAppState extends State<LaetusApp> {
  String _imagePath;
  final picker = ImagePicker();

  Future _getImage(camOrGal) async {
    ImageSource source;

    camOrGal == 'camera'
        ? source = ImageSource.camera
        : source = ImageSource.gallery;

    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imagePath = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Laetus"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: _imagePath == null
              // --------------------------------------------------------------------
              ? ColorPickerWidget('assets/images/sample_image.jpg')
              : ColorPickerWidget(_imagePath),
          // --------------------------------------------------------------------
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? Icon(CupertinoIcons.camera)
                  : Icon(Icons.add_a_photo),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Color(0xFF737373),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text('Gallery'),
                                onTap: () {
                                  // --------------------------------------------------------------------
                                  setState(
                                    () {
                                      _getImage('gallery');
                                      Navigator.pop(context);
                                    },
                                  );
                                  // --------------------------------------------------------------------
                                },
                              ),
                              ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text('Camera'),
                                  onTap: () {
                                    _getImage('camera');
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
