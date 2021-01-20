import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() => runApp(LaetusApp());

class LaetusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Laetus"),
        ),
        body: Image.asset('assets/images/sample_image.jpg'),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Theme.of(context).platform == TargetPlatform.iOS
        //       ? CupertinoButton(
        //           onPressed: () {},
        //           child: Icon(CupertinoIcons.camera),
        //         )
        //       : RaisedButton(
        //           onPressed: () {},
        //           child: Icon(Icons.camera),
        //         ),
      ),
      // ),
    );
  }
}
