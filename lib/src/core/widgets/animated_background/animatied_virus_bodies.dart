import 'package:flutter/material.dart';

class AnimatedVirusBodies extends StatelessWidget {
  const AnimatedVirusBodies(
      {Key? key,
      required this.targetOffset,
      required this.size,
      this.left,
      this.right,
      this.bottom,
      this.alignment,
      this.top,
      this.child,
      required this.path})
      : super(key: key);

  final Offset? targetOffset;
  final Size size;
  final String path;
  final double? left;
  final double? top;
  final double? bottom;
  final double? right;
  final Alignment? alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Transform.translate(
          offset: targetOffset!,
          child: Image.asset(
            path,
            alignment: alignment ?? Alignment.centerLeft,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
