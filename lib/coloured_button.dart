import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';

class ColouredButton extends StatelessWidget {
  final Color colour;

  const ColouredButton(this.colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: 140,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        child: Center(
          child: InvertColors(
            child: Text(
              'More details...',
              style: TextStyle(
                  color: colour, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTapDown: (_) {
          print('button pressed routing to...');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ColourInfo()),
          // );
        },
      ),
    );
  }
}
