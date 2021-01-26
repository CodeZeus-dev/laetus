import 'package:flutter/material.dart';

class Dropper extends StatelessWidget {
  final Color colour;

  const Dropper(this.colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 85,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                'assets/images/dropper.jpeg',
                scale: 7.0,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
