import 'package:flutter/material.dart';

class dropper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Container(
                //Box with colour
                ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                'assets/images/dropper.jpeg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
