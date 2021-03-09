import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:laetus/authentication_service.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';

import './color_details_screen.dart';
import '../extract_arguments.dart';
import '../dropper.dart';

class ColorSelectionScreen extends StatefulWidget {
  static const routeName = '/color/selection';
  @override
  State<StatefulWidget> createState() {
    return _ColorSelectionScreenState();
  }
}

class _ColorSelectionScreenState extends State<ColorSelectionScreen> {
  File _image;
  final picker = ImagePicker();
  final AssetImage sampleImage = AssetImage('assets/images/sample_image.jpeg');
  Positioned dropper = Positioned(
    child: Container(width: 0.0, height: 0.0),
  );
  Color currentSelection;

  Future _getImage(camOrGal) async {
    ImageSource source;

    camOrGal == 'camera'
        ? source = ImageSource.camera
        : source = ImageSource.gallery;

    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print("Image value: $_image");
      } else {
        print(
            'No image selected - if you\'re seeing this something is really wrong');
      }
    });
  }

  void _screenTouched(dynamic details, ImgDetails img, RenderBox box) {
    double widgetScale = box.size.width / img.width;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    var x = (localOffset.dx / widgetScale).round();
    var y = (localOffset.dy / widgetScale).round();
    bool flippedX = box.size.width - localOffset.dx < Dropper.totalWidth;
    bool flippedY = localOffset.dy < Dropper.totalHeight;
    if (box.size.height - localOffset.dy > 0 && localOffset.dy > 0) {
      currentSelection = img.pixelColorAt(x, y);
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
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/LAETUS_LOGO.png',
          width: 120,
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Log Out"),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            ImagePixels(
                imageProvider: _image == null ? sampleImage : FileImage(_image),
                builder: (BuildContext context, ImgDetails img) {
                  return GestureDetector(
                    child: _image == null
                        ? Image(image: sampleImage)
                        : Image.file(_image),
                    onPanUpdate: (DragUpdateDetails details) {
                      _screenTouched(details, img, context.findRenderObject());
                    },
                    onTapDown: (TapDownDetails details) {
                      _screenTouched(details, img, context.findRenderObject());
                    },
                  );
                }),
            dropper
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "hiddenButton",
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Container(),
            onPressed: () => {},
          ),
          Builder(
            builder: (context) => FloatingActionButton(
                heroTag: "addPhotoButton",
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
          FloatingActionButton(
              heroTag: "colorDetailsButton",
              child: Center(
                child: Image.asset(
                  'assets/images/dropper_white_transparent_background.jpeg',
                  scale: 8.5,
                ),
              ),
              onPressed: () {
                print("Image value: $_image");
                if (currentSelection != null && _image != null) {
                  Navigator.pushNamed(
                    context,
                    ColorDetailsScreen.routeName,
                    arguments:
                        ExtractArguments(FileImage(_image), currentSelection),
                  );
                }
              }),
        ],
      ),
    );
  }
}
