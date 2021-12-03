import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/assets_path.dart';
import '../../utils/styles.dart';
import 'animated_viruses.dart';
import 'animatied_virus_bodies.dart';
import 'app_assets.dart';
import 'gif_background_widget.dart';

class AnimatedParticlesThird extends StatefulWidget {
  final BoxConstraints constraints;
  final double mouseY;
  final double mouseX;
  final double objWave;

  const AnimatedParticlesThird({
    Key? key,
    required this.constraints,
    required this.mouseY,
    required this.mouseX,
    required this.objWave,
  }) : super(key: key);

  @override
  _AnimatedParticlesThirdState createState() => _AnimatedParticlesThirdState();
}

class _AnimatedParticlesThirdState extends State<AnimatedParticlesThird>
    with SingleTickerProviderStateMixin {
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
    );
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
          left: widget.constraints.maxWidth * 0.901,
          top: widget.constraints.maxHeight * 0.685,
          path: AssetsPath.animatedBack3Vbody0,
          size: Size(
            widget.constraints.maxWidth * 0.077,
            widget.constraints.maxHeight * 0.137,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.65,
          top: -widget.constraints.maxHeight * 0.092,
          alignment: Alignment.centerRight,
          path: AssetsPath.animatedBack3Vbody1,
          size: Size(
            widget.constraints.maxWidth * 0.397,
            widget.constraints.maxHeight * 0.846,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.901,
          top: widget.constraints.maxHeight * 0.09,
          path: AssetsPath.animatedBack3Vbody2,
          size: Size(
            widget.constraints.maxWidth * 0.144,
            widget.constraints.maxHeight * 0.269,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.13,
          top: widget.constraints.maxHeight * 0.101,
          path: AssetsPath.animatedBack3Vbody7,
          size: Size(
            widget.constraints.maxWidth * 0.03,
            widget.constraints.maxHeight * 0.05,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.62,
          top: widget.constraints.maxHeight * 0.052,
          alignment: Alignment.topLeft,
          path: AssetsPath.animatedBack3Vbody8,
          size: Size(
            widget.constraints.maxWidth * 0.144,
            widget.constraints.maxHeight * 0.361,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.133,
          top: widget.constraints.maxHeight * 0.801,
          path: AssetsPath.animatedBack3Vbody10,
          size: Size(
            widget.constraints.maxWidth * 0.05,
            widget.constraints.maxHeight * 0.09,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / -4,
          ),
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
          left: widget.constraints.maxWidth * 0.085,
          top: -widget.constraints.maxHeight * 0.09,
          path: AssetsPath.animatedBack3Vbody6,
          size: Size(
            widget.constraints.maxWidth * 0.48,
            widget.constraints.maxHeight * 0.401,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.52,
          top: -widget.constraints.maxHeight * 0.09,
          path: AssetsPath.animatedBack3Vbody5,
          size: Size(
            widget.constraints.maxWidth * 0.25,
            widget.constraints.maxHeight * 0.38,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.812,
          top: -widget.constraints.maxHeight * 0.08,
          path: AssetsPath.animatedBack3Vbody3,
          size: Size(
            widget.constraints.maxWidth * 0.126,
            widget.constraints.maxHeight * 0.22,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.68,
          top: widget.constraints.maxHeight * 0.287,
          path: AssetsPath.animatedBack3Vbody4,
          size: Size(
            widget.constraints.maxWidth * 0.09,
            widget.constraints.maxHeight * 0.16,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.483,
          top: widget.constraints.maxHeight * 0.787,
          path: AssetsPath.animatedBack3Vbody11,
          alignment: Alignment.centerRight,
          size: Size(
            widget.constraints.maxWidth * 0.176,
            widget.constraints.maxHeight * 0.289,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.066,
          top: widget.constraints.maxHeight * 0.85,
          path: AssetsPath.animatedBack3Vbody12,
          alignment: Alignment.bottomCenter,
          size: Size(
            widget.constraints.maxWidth * 0.05,
            widget.constraints.maxHeight * 0.08,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / 4,
            widget.mouseY / 4 + widget.objWave / 4,
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

      // if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
