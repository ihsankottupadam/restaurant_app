import 'package:flutter/material.dart';

class BoxIcon extends StatelessWidget {
  const BoxIcon({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1),
      ),
      child: Center(
        child: Icon(
          Icons.circle,
          color: color,
          size: 15,
        ),
      ),
    );
  }
}
