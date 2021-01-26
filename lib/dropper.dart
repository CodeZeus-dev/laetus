import 'package:flutter/material.dart';

class Dropper extends StatelessWidget {
  final Color colour;

  const Dropper(this.colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 40,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.circular(12),
              ),
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
