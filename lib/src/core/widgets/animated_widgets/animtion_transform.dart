import 'package:flutter/material.dart';

class MainImage extends AnimatedWidget {
  final String image;
  const MainImage(
      {Key? key, required Animation<double> animation, required this.image})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.rotate(
      angle: animation.value,
      child: SizedBox(
        child: Image.asset(image),
      ),
    );
  }
}
