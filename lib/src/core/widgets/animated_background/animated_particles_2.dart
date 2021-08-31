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

class AnimatedParticlesSecond extends StatefulWidget {
  final BoxConstraints constraints;
  final Offset offset;

  const AnimatedParticlesSecond(
      {Key? key, required this.constraints, required this.offset})
      : super(key: key);

  @override
  _AnimatedParticlesSecondState createState() =>
      _AnimatedParticlesSecondState();
}

class _AnimatedParticlesSecondState extends State<AnimatedParticlesSecond>
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
          asset: AssetsPath.gifBackground2,
        ),
        AnimatesViruses(
          size: Size(width * 1.2, height * 1.2),
          targetOffset:
              Offset(0.5 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath2)[1],
          duration: 15000,
          opacity: 1,
          fit: BoxFit.contain,
        ),
        AnimatesViruses(
          size: Size(width * 1.2, height * 1.2),
          targetOffset:
              Offset(0.5 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath2)[0],
          duration: 13000,
          opacity: 1,
          fit: BoxFit.contain,
        ),
        AnimatedVirusBodies(
          path: AssetsPath.animatedBack2Vbody0,
          size: Size(widget.constraints.maxWidth * 0.25,
              widget.constraints.maxHeight * 0.25),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: -100,
          left: widget.constraints.maxWidth * 0.5,
          path: AssetsPath.animatedBack2Vbody1,
          size: Size(widget.constraints.maxWidth * 0.25,
              widget.constraints.maxHeight * 0.25),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.1,
          left: widget.constraints.maxWidth * 0.2,
          path: AssetsPath.animatedBack2Vbody2,
          size: Size(widget.constraints.maxWidth * 0.2,
              widget.constraints.maxHeight * 0.2),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0,
          path: AssetsPath.animatedBack2Vbody3,
          size: Size(widget.constraints.maxWidth * 0.65,
              widget.constraints.maxHeight * 0.65),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.01,
          left: widget.constraints.maxHeight * 0.55,
          path: AssetsPath.animatedBack2Vbody4,
          size: Size(widget.constraints.maxWidth * 0.08,
              widget.constraints.maxHeight * 0.08),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.15,
          left: widget.constraints.maxHeight * 0.5,
          path: AssetsPath.animatedBack2Vbody5,
          size: Size(widget.constraints.maxWidth * 0.15,
              widget.constraints.maxHeight * 0.15),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: -150,
          left: widget.constraints.maxWidth * 0.6,
          path: AssetsPath.animatedBack2Vbody6,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          right: widget.constraints.maxWidth * 0.15,
          path: AssetsPath.animatedBack2Vbody7,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.2,
          right: widget.constraints.maxWidth * 0.05,
          path: AssetsPath.animatedBack2Vbody8,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.25,
          right: widget.constraints.maxWidth * 0.05,
          height: widget.constraints.maxHeight * 0.5,
          width: widget.constraints.maxWidth * 0.5,
          child: Transform.translate(
            offset: Offset(widget.offset.dx * 0.02, widget.offset.dy * 0.01),
            child: Image.asset(AssetsPath.gifVirusTyphoid),
          ),
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
