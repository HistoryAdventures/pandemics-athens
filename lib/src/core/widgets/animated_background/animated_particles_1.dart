import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_viruses.dart';
import 'package:history_of_adventures/src/features/animated_background/animatied_virus_bodies.dart';
import 'package:history_of_adventures/src/features/animated_background/gif_background_widget.dart';

import '../../core/utils/styles.dart';
import 'app_assets.dart';

class AnimatedParticlesFirst extends StatefulWidget {
  final BoxConstraints constraints;
  final Offset offset;

  const AnimatedParticlesFirst({
    Key? key,
    required this.constraints,
    required this.offset,
  }) : super(key: key);

  @override
  _AnimatedParticlesFirstState createState() => _AnimatedParticlesFirstState();
}

class _AnimatedParticlesFirstState extends State<AnimatedParticlesFirst>
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
          asset: AssetsPath.gifBackground1,
        ),

        AnimatesViruses(
          alignment: Alignment.centerLeft,
          size: Size(width * 2, height * 2),
          targetOffset:
              Offset(0.5 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath1)[1],
          duration: 25000,
          opacity: 0.5,
          fit: BoxFit.cover,
        ),
        AnimatesViruses(
          size: Size(width, height * 2),
          targetOffset: Offset(0, 0.5 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath1)[0],
          duration: 23000,
          opacity: 0.4,
          fit: BoxFit.cover,
        ),

        AnimatedVirusBodies(
          right: 0,
          top: widget.constraints.maxHeight * 0.3,
          path: AssetsPath.animatedBack1Vbody0,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.25),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: 0,
          right: -150,
          path: AssetsPath.animatedBack1Vbody1,
          size: Size(widget.constraints.maxWidth * 0.4,
              widget.constraints.maxHeight * 0.4),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.1,
          right: widget.constraints.maxWidth * 0.3,
          path: AssetsPath.animatedBack1Vbody2,
          size: Size(widget.constraints.maxWidth * 0.1,
              widget.constraints.maxHeight * 0.1),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.15,
          right: widget.constraints.maxWidth * 0.3,
          path: AssetsPath.animatedBack1Vbody3,
          size: Size(widget.constraints.maxWidth * 0.2,
              widget.constraints.maxHeight * 0.2),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          left: widget.constraints.maxHeight * 0.2,
          path: AssetsPath.animatedBack1Vbody5,
          size: Size(widget.constraints.maxWidth * 0.35,
              widget.constraints.maxHeight * 0.35),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: 0,
          left: 0,
          path: AssetsPath.animatedBack1Vbody6,
          size: Size(widget.constraints.maxWidth * 0.4,
              widget.constraints.maxHeight * 0.4),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          right: widget.constraints.maxWidth * 0.9,
          path: AssetsPath.animatedBack1Vbody7,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.1,
          left: widget.constraints.maxHeight * 0.25,
          path: AssetsPath.animatedBack1Vbody4,
          size: Size(widget.constraints.maxWidth * 0.08,
              widget.constraints.maxHeight * 0.08),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: -50,
          left: widget.constraints.maxWidth * 0.25,
          path: AssetsPath.animatedBack1Vbody8,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.25,
          right: 0,
          height: widget.constraints.maxHeight * 0.55,
          width: widget.constraints.maxWidth * 0.55,
          child: Transform.translate(
            offset: Offset(widget.offset.dx * 0.02, widget.offset.dy * 0.01),
            child: Image.asset(AssetsPath.gifVirus),
          ),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.25,
          right: 0,
          height: widget.constraints.maxHeight * 0.55,
          width: widget.constraints.maxWidth * 0.55,
          child: Transform.translate(
            offset: Offset(widget.offset.dx * 0.02, widget.offset.dy * 0.01),
            child: Image.asset(AssetsPath.gifVirus),
          ),
        )
        // AnimatesViruses(
        //   size: Size(2 * width, 2 * height),
        //   targetOffset: Offset(0.25 * p3Counter, 0.1125 * p3Counter),
        //   path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath1)[2],
        //   duration: 14000,
        //   opacity: 0.1,
        //   fit: BoxFit.cover,
        //   color: Colors.black,
        // ),
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
