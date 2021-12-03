import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/assets_path.dart';
import '../../utils/styles.dart';
import 'animated_viruses.dart';
import 'animatied_virus_bodies.dart';
import 'app_assets.dart';
import 'gif_background_widget.dart';

class AnimatedParticlesFirst extends StatefulWidget {
  final BoxConstraints constraints;
  final double mouseY;
  final double mouseX;
  final double objWave;

  const AnimatedParticlesFirst({
    Key? key,
    required this.constraints,
    required this.mouseY,
    required this.mouseX,
    required this.objWave,
  }) : super(key: key);

  @override
  _AnimatedParticlesFirstState createState() => _AnimatedParticlesFirstState();
}

class _AnimatedParticlesFirstState extends State<AnimatedParticlesFirst>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  int p1Counter = 0, p2Counter = 0;
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
    // width = MediaQuery.of(context).size.width;
    // height = MediaQuery.of(context).size.height;
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
          targetOffset: Offset(
            0.5 * p2Counter,
            0.14 * p2Counter - (widget.mouseY / 6),
          ),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath1)[1],
          duration: 25000,
          opacity: 0.5,
          fit: BoxFit.cover,
        ),
        AnimatesViruses(
          size: Size(width, height * 2),
          targetOffset: Offset(0, 0.5 * p2Counter - (widget.mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath1)[0],
          duration: 23000,
          opacity: 0.4,
          fit: BoxFit.cover,
        ),

        AnimatedVirusBodies(
          left: 0.898 * widget.constraints.maxWidth,
          top: 0.16 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack1Vbody0,
          size: Size(
            widget.constraints.maxWidth * 0.144,
            widget.constraints.maxHeight * 0.27,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.639,
          top: -widget.constraints.maxHeight * 0.09,
          path: AssetsPath.animatedBack1Vbody1,
          size: Size(
            widget.constraints.maxWidth * 0.415,
            widget.constraints.maxHeight * 0.435,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.08,
          left: widget.constraints.maxWidth * 0.55,
          path: AssetsPath.animatedBack1Vbody2,
          size: Size(
            widget.constraints.maxWidth * 0.063,
            widget.constraints.maxHeight * 0.107,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.072,
          left: widget.constraints.maxWidth * 0.389,
          path: AssetsPath.animatedBack1Vbody3,
          size: Size(
            widget.constraints.maxWidth * 0.204,
            widget.constraints.maxHeight * 0.272,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.656,
          left: widget.constraints.maxHeight * 0.88,
          path: AssetsPath.animatedBack1Vbody5,
          size: Size(
            widget.constraints.maxWidth * 0.175,
            widget.constraints.maxHeight * 0.288,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.61,
          left: -widget.constraints.maxWidth * 0.05,
          path: AssetsPath.animatedBack1Vbody6,
          size: Size(
            widget.constraints.maxWidth * 0.29,
            widget.constraints.maxHeight * 0.506,
          ),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / 4,
              widget.mouseY / -4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.134,
          left: widget.constraints.maxWidth * 0.82,
          path: AssetsPath.animatedBack1Vbody7,
          size: Size(
            widget.constraints.maxWidth * 0.055,
            widget.constraints.maxHeight * 0.094,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.068,
          left: widget.constraints.maxHeight * 0.0612,
          path: AssetsPath.animatedBack1Vbody4,
          size: Size(
            widget.constraints.maxWidth * 0.205,
            widget.constraints.maxHeight * 0.361,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.772,
          left: widget.constraints.maxWidth * 0.25,
          path: AssetsPath.animatedBack1Vbody8,
          size: Size(
            widget.constraints.maxWidth * 0.235,
            widget.constraints.maxHeight * 0.381,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.25,
          right: 0,
          height: widget.constraints.maxHeight * 0.55,
          width: widget.constraints.maxWidth * 0.55,
          child: Transform.translate(
            offset: Offset(widget.mouseX / 4 + widget.objWave / 4,
                widget.mouseY / -4 + widget.objWave / -4),
            child: Image.asset(AssetsPath.gifVirus),
          ),
        ),

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

      if (p1Counter > -width && p1Counter != 0 || p1Counter == (width ~/ 4)) {
        p1Counter--;
      } else {
        p1Counter = width ~/ 2;
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
