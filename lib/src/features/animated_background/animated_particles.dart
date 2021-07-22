import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

import 'app_assets.dart';

class AnimatedParticles extends StatefulWidget {
  const AnimatedParticles({Key? key}) : super(key: key);

  @override
  _AnimatedParticlesState createState() => _AnimatedParticlesState();
}

class _AnimatedParticlesState extends State<AnimatedParticles>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;
  int p1Counter = 0, p2Counter = 0, p3Counter = 0;
  bool reversed = false;
  double width = window.physicalSize.width / window.devicePixelRatio,
      height = window.physicalSize.height / window.devicePixelRatio;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Times.backgrounAnimationDuration,
    )..repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    _controller.addListener(_handleParticleAnimation);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatesViruses(
          size: Size(2 * width, 2 * height),
          targetOffset:
              Offset(0.25 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths()[1],
          duration: 15000,
          opacity: 0.5,
          fit: BoxFit.cover,
        ),
        AnimatesViruses(
          size: Size(2 * width, 2 * height),
          targetOffset: Offset(p1Counter * 0.5, mouseY / 6),
          path: IAppAssets().getAssetPaths()[0],
          duration: 13000,
          opacity: 0.4,
          fit: BoxFit.cover,
        ),
        AnimatesViruses(
          size: Size(2 * width, 2 * height),
          targetOffset: Offset(0.25 * p3Counter, 0.1125 * p3Counter),
          path: IAppAssets().getAssetPaths()[2],
          duration: 14000,
          opacity: 0.1,
          fit: BoxFit.cover,
          color: Colors.black,
        ),
      ],
    );
  }

  void _handleParticleAnimation() {
    if (_controller.isAnimating) {
      p1Counter < width * 2 ? p1Counter++ : p1Counter = 0;

      if (p2Counter < width && p2Counter != 0 || p2Counter == (-width ~/ 4)) {
        p2Counter++;
      } else {
        p2Counter = -width ~/ 2;
      }

      if (p3Counter > -width && p3Counter != 0 || p3Counter == (width ~/ 4)) {
        p3Counter--;
      } else {
        p3Counter = width ~/ 2;
      }

      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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

      // rect: RelativeRectTween(
      //   begin: RelativeRect.fromSize(
      //       Rect.fromLTWH(
      //           initialOffset.dx, initialOffset.dy, size!.width, size!.height),
      //       size!),
      //   end: RelativeRect.fromSize(
      //       Rect.fromLTWH(
      //           targetOffset.dx, targetOffset.dy, size!.width, size!.height),
      //       size!),

      duration: Duration(milliseconds: duration),
      child: SizedBox(
        height: size?.height ?? MediaQuery.of(context).size.height,
        width: size?.width ?? MediaQuery.of(context).size.width,
        child: Image.asset(
          path,
          fit: fit ?? BoxFit.fitWidth,
          color: (color ?? Colors.white).withOpacity(opacity),
        ),
      ),
    );
  }
}
