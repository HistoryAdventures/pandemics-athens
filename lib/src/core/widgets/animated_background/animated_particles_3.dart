import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_viruses.dart';
import 'package:history_of_adventures/src/features/animated_background/animatied_virus_bodies.dart';
import 'package:history_of_adventures/src/features/animated_background/gif_background_widget.dart';

import '../../core/utils/styles.dart';
import 'app_assets.dart';

class AnimatedParticlesThird extends StatefulWidget {
  final BoxConstraints constraints;
  final Offset offset;

  const AnimatedParticlesThird({
    Key? key,
    required this.constraints,
    required this.offset,
  }) : super(key: key);

  @override
  _AnimatedParticlesThirdState createState() => _AnimatedParticlesThirdState();
}

class _AnimatedParticlesThirdState extends State<AnimatedParticlesThird>
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
        GifBackground(
          size: Size(widget.constraints.maxWidth, widget.constraints.maxHeight),
          asset: AssetsPath.gifBackground3,
        ),
        AnimatedVirusBodies(
          right: -50,
          bottom: widget.constraints.maxHeight * 0.2,
          path: AssetsPath.animatedBack3Vbody0,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: -100,
          right: -100,
          alignment: Alignment.centerRight,
          path: AssetsPath.animatedBack3Vbody1,
          size: Size(widget.constraints.maxWidth * 0.8,
              widget.constraints.maxHeight * 0.85),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          left: widget.constraints.maxWidth * 0.15,
          path: AssetsPath.animatedBack3Vbody2,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          right: widget.constraints.maxWidth * 0.2,
          path: AssetsPath.animatedBack3Vbody7,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          left: -20,
          alignment: Alignment.topLeft,
          path: AssetsPath.animatedBack3Vbody8,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: 0,
          right: widget.constraints.maxHeight * 0.4,
          path: AssetsPath.animatedBack3Vbody10,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatesViruses(
          size: Size(width * 1.2, height * 1.2),
          targetOffset:
              Offset(0.5 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath3)[1],
          duration: 15000,
          opacity: 1,
          fit: BoxFit.contain,
        ),
        AnimatesViruses(
          size: Size(width, height),
          targetOffset:
              Offset(0.5 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath3)[0],
          duration: 13000,
          opacity: 1,
          fit: BoxFit.cover,
        ),
        AnimatedVirusBodies(
          right: -50,
          bottom: widget.constraints.maxHeight * 0.2,
          path: AssetsPath.animatedBack3Vbody0,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: -50,
          right: -50,
          alignment: Alignment.centerRight,
          path: AssetsPath.animatedBack3Vbody1,
          size: Size(widget.constraints.maxWidth * 0.85,
              widget.constraints.maxHeight * 0.85),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: -50,
          left: widget.constraints.maxWidth * 0.15,
          path: AssetsPath.animatedBack3Vbody6,
          size: Size(widget.constraints.maxWidth * 0.5,
              widget.constraints.maxHeight * 0.5),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: 0,
          right: widget.constraints.maxHeight * 0.2,
          path: AssetsPath.animatedBack3Vbody5,
          size: Size(widget.constraints.maxWidth * 0.35,
              widget.constraints.maxHeight * 0.35),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: 0,
          right: -30,
          path: AssetsPath.animatedBack3Vbody3,
          size: Size(widget.constraints.maxWidth * 0.25,
              widget.constraints.maxHeight * 0.25),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.3,
          right: widget.constraints.maxHeight * 0.2,
          path: AssetsPath.animatedBack3Vbody4,
          size: Size(widget.constraints.maxWidth * 0.2,
              widget.constraints.maxHeight * 0.2),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.15,
          right: 0,
          path: AssetsPath.animatedBack3Vbody11,
          alignment: Alignment.centerRight,
          size: Size(widget.constraints.maxWidth * 0.2,
              widget.constraints.maxHeight * 0.2),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: -50,
          left: 0,
          path: AssetsPath.animatedBack3Vbody12,
          alignment: Alignment.bottomCenter,
          size: Size(widget.constraints.maxWidth * 0.4,
              widget.constraints.maxHeight * 0.4),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
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
