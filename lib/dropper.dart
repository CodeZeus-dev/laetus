import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dropper extends StatelessWidget {
  final Color colour;
  final bool flippedX;
  final bool flippedY;

  const Dropper(this.colour, this.flippedX, this.flippedY);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateY((flippedX ? 180 : 0) / 180 * pi)
        ..rotateX((flippedY ? 180 : 0) / 180 * pi),
      child: Transform.translate(
        offset: flippedY ? const Offset(0.0, -170.0) : const Offset(0.0, 0.0),
        child: Container(
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
        ),
      ),
    );
  }
}
