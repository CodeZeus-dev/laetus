import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pixels/image_pixels.dart';
import 'dart:io';
import 'dart:async';

import './dropper.dart';

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
  final picker = ImagePicker();
  final AssetImage sampleImage = AssetImage('assets/images/sample_image.jpeg');
  Positioned dropper = Positioned(
    child: Container(width: 0.0, height: 0.0),
  );

  Future _getImage(camOrGal) async {
    ImageSource source;

    camOrGal == 'camera'
        ? source = ImageSource.camera
        : source = ImageSource.gallery;

    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _screenTouched(dynamic details, ImgDetails img, RenderBox box) {
    double widgetScale = box.size.width / img.width;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    var x = (localOffset.dx / widgetScale).round();
    var y = (localOffset.dy / widgetScale).round();
    bool flippedX =
        box.size.width - localOffset.dx < 60; // NB magic number to be removed
    bool flippedY = localOffset.dy < 85; // NB magic number to be removed
    if (box.size.height - localOffset.dy > 0 && localOffset.dy > 0) {
      setState(() {
        _createDropper(localOffset.dx, box.size.height - localOffset.dy,
            img.pixelColorAt(x, y), flippedX, flippedY);
      });
    }
  }

  void _createDropper(
      left, bottom, Color colour, bool flippedX, bool flippedY) {
    dropper = Positioned(
      left: left,
      bottom: bottom,
      child: Dropper(colour, flippedX, flippedY),
    );
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
          child: Stack(
            children: <Widget>[
              ImagePixels(
                  imageProvider:
                      _image == null ? sampleImage : FileImage(_image),
                  builder: (BuildContext context, ImgDetails img) {
                    return GestureDetector(
                      child: _image == null
                          ? Image(image: sampleImage)
                          : Image.file(_image),
                      onPanUpdate: (DragUpdateDetails details) {
                        _screenTouched(
                            details, img, context.findRenderObject());
                      },
                      onTapDown: (TapDownDetails details) {
                        _screenTouched(
                            details, img, context.findRenderObject());
                      },
                    );
                  }),
              dropper
            ],
          ),
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
                                  _getImage('gallery');
                                  Navigator.pop(context);
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
