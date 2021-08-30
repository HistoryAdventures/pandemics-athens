import 'package:flutter/material.dart';

class AnimatesViruses extends StatelessWidget {
  final Offset targetOffset;
  final String path;
  final Size? size;
  final int duration;
  final Alignment? alignment;
  final double opacity;
  final BoxFit? fit;
  final Color? color;

  AnimatesViruses({
    Key? key,
    required this.targetOffset,
    required this.path,
    this.size,
    this.alignment,
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
      child: Container(
        alignment: alignment ?? Alignment.center,
        height: size?.height ?? MediaQuery.of(context).size.height,
        width: size?.width ?? MediaQuery.of(context).size.width,
        child: InteractiveViewer(
          scaleEnabled: false,
          panEnabled: false,
          constrained: false,
          maxScale: 2,
          minScale: 2,
          child: Image.asset(
            path,
            fit: fit ?? BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
