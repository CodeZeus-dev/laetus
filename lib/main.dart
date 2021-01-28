import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:laetus/screens/color_selection_screen.dart';
import 'dart:io';
import 'dart:async';

import './dropper.dart';

import './screens/color_selection_screen.dart';
import './screens/color_details_screen.dart';

void main() => runApp(LaetusApp());

class LaetusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ColorSelectionScreen.routeName,
      routes: {
        ColorSelectionScreen.routeName: (context) => ColorSelectionScreen(),
        ColorDetailsScreen.routeName: (context) => ColorDetailsScreen(),
      },
    );
  }
}
