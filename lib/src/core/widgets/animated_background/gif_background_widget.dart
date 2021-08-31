import 'package:flutter/material.dart';

class GifBackground extends StatelessWidget {
  final Size size;
  final String asset;
  const GifBackground({
    required this.size,
    required this.asset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
      ),
    );
  }
}
