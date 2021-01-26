import 'package:flutter/material.dart';

class ColouredButton extends StatelessWidget {
  final Color colour;

  const ColouredButton(this.colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        child: Text('More details...'),
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
