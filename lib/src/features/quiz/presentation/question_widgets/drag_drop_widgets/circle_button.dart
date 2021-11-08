import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final double width;

  const CircleButton({
    Key? key,
    required this.color,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
              width: 2,
              color: const Color.fromRGBO(
                161,
                161,
                161,
                1,
              ))),
    );
  }
}
