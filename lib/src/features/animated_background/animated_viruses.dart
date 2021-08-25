
import 'package:flutter/material.dart';

class AnimatesViruses extends StatelessWidget {
  final Offset targetOffset;
  final String path;
  final Size? size;
  final int duration;
  final double opacity;
  final BoxFit? fit;
  final Color? color;

  const AnimatesViruses({
    Key? key,
    required this.targetOffset,
    required this.path,
    this.size,
    required this.duration,
    required this.opacity,
    this.fit,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: targetOffset.dx,
      top: targetOffset.dy,
      duration: Duration(milliseconds: duration),
      child: SizedBox(
        height: size?.height ?? MediaQuery.of(context).size.height,
        width: size?.width ?? MediaQuery.of(context).size.width,
        child: Image.asset(
          path,
          fit: fit ?? BoxFit.fitWidth,
        ),
      ),
    );
  }
}
