import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
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
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showPicker(context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Laetus"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Image.asset('assets/images/sample_image.jpg'),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.blueGrey,
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? Icon(CupertinoIcons.camera)
                    : Icon(Icons.camera),
              ),
              FloatingActionButton(
                onPressed: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.blueGrey,
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? Icon(CupertinoIcons.camera)
                    : Icon(Icons.camera),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// floatingActionButton: FloatingActionButton(
//     onPressed: () {
//       _imgFromCamera();
//       Navigator.of(context).pop();
//     },
//     backgroundColor: Colors.blueGrey,
//     child: Theme.of(context).platform == TargetPlatform.iOS
//         ? Icon(CupertinoIcons.camera)
//         : Icon(Icons.camera)),
