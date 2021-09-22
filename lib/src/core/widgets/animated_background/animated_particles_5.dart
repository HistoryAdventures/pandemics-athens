import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/assets_path.dart';
import '../../utils/styles.dart';
import '../animated_widgets/gif_contrrol.dart';
import 'animated_viruses.dart';
import 'animatied_virus_bodies.dart';
import 'app_assets.dart';
import 'gif_background_widget.dart';

class AnimatedParticlesFive extends StatefulWidget {
  final BoxConstraints constraints;
  final double mouseY;
  final double mouseX;
  final double objWave;

  const AnimatedParticlesFive({
    Key? key,
    required this.constraints,
    required this.mouseY,
    required this.mouseX,
    required this.objWave,
  }) : super(key: key);

  @override
  _AnimatedParticlesFiveState createState() => _AnimatedParticlesFiveState();
}

class _AnimatedParticlesFiveState extends State<AnimatedParticlesFive>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;
  int p1Counter = 0, p2Counter = 0, p3Counter = 0;
  bool reversed = false;
  late GifController controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Times.backgrounAnimationDuration,
    )..repeat(reverse: true);
    controller = GifController(vsync: this);

    controller.repeat(
      min: 0,
      max: 150,
      period: const Duration(seconds: 4),
      reverse: true,
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
          size: Size(
            widget.constraints.maxWidth,
            widget.constraints.maxHeight,
          ),
          asset: AssetsPath.gifBackground5,
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.304,
          top: widget.constraints.maxHeight * 0.138,
          path: AssetsPath.animatedBack5Vbody5,
          alignment: Alignment.topLeft,
          size: Size(
            widget.constraints.maxWidth * 0.23,
            widget.constraints.maxHeight * 0.45,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.044,
          top: widget.constraints.maxWidth * 0.802,
          path: AssetsPath.animatedBack5Vbody8,
          size: Size(
            widget.constraints.maxWidth * 0.192,
            widget.constraints.maxHeight * 0.29,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.915,
          top: widget.constraints.maxHeight * 0.114,
          path: AssetsPath.animatedBack5Vbody0,
          alignment: Alignment.centerRight,
          size: Size(
            widget.constraints.maxWidth * 0.144,
            widget.constraints.maxHeight * 0.27,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.64,
          top: widget.constraints.maxHeight * 0.56,
          path: AssetsPath.animatedBack5Vbody1,
          size: Size(
            widget.constraints.maxWidth * 0.17,
            widget.constraints.maxHeight * 0.28,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.76,
          top: widget.constraints.maxHeight * 0.47,
          alignment: Alignment.centerRight,
          path: AssetsPath.animatedBack5Vbody2,
          size: Size(
            widget.constraints.maxWidth * 0.28,
            widget.constraints.maxHeight * 0.602,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        // AnimatedVirusBodies(
        //   top: widget.constraints.maxHeight * 0.05,
        //   left: widget.constraints.maxWidth * 0.15,
        //   path: AssetsPath.animatedBack5Vbody0,
        //   size: Size(
        //     widget.constraints.maxWidth * 0.08,
        //     widget.constraints.maxHeight * 0.08,
        //   ),
        //   targetOffset: Offset(
        //     widget.mouseX / 4 + widget.objWave / 4,
        //     widget.mouseY / -4 + widget.objWave / -4,
        //   ),
        // ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.663,
          top: widget.constraints.maxHeight * 0.856,
          path: AssetsPath.animatedBack5Vbody4,
          size: Size(
            widget.constraints.maxWidth * 0.05,
            widget.constraints.maxHeight * 0.08,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        // AnimatedVirusBodies(
        //   left: widget.constraints.maxWidth*,
        //   top:,
        //   path: AssetsPath.animatedBack5Vbody5,
        //   size: Size(widget.constraints.maxWidth * 0.15,
        //       widget.constraints.maxHeight * 0.15),
        //   targetOffset: Offset(
        //     widget.mouseX / 4 + widget.objWave / 4,
        //     widget.mouseY / -4 + widget.objWave / -4,
        //   ),
        // ),
        // AnimatedVirusBodies(
        //   left: widget.constraints.maxWidth * 0.663,
        //   top: widget.constraints.maxHeight * 0.856,
        //   alignment: Alignment.centerLeft,
        //   path: AssetsPath.animatedBack5Vbody6,
        //   size: Size(
        //     widget.constraints.maxWidth * 0.05,
        //     widget.constraints.maxHeight * 0.08,
        //   ),
        //   targetOffset: Offset(
        //     widget.mouseX / -4 + widget.objWave / 4,
        //     widget.mouseY / 4 + widget.objWave / 4,
        //   ),
        // ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.13,
          top: widget.constraints.maxHeight * 0.54,
          path: AssetsPath.animatedBack5Vbody7,
          alignment: Alignment.centerLeft,
          size: Size(
            widget.constraints.maxWidth * 0.126,
            widget.constraints.maxHeight * 0.225,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.0145,
          top: widget.constraints.maxHeight * 0.335,
          path: AssetsPath.animatedBack5Vbody10,
          alignment: Alignment.bottomLeft,
          size: Size(
            widget.constraints.maxWidth * 0.0875,
            widget.constraints.maxHeight * 0.156,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: -widget.constraints.maxWidth * 0.05,
          top: -widget.constraints.maxHeight * 0.09,
          path: AssetsPath.animatedBack5Vbody11,
          alignment: Alignment.topLeft,
          size: Size(
            widget.constraints.maxWidth * 0.195,
            widget.constraints.maxHeight * 0.525,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.01,
          right: widget.constraints.maxWidth * 0.05,
          height: widget.constraints.maxHeight * 0.5,
          width: widget.constraints.maxWidth * 0.5,
          child: Transform.translate(
            offset: Offset(widget.mouseX / 4 + widget.objWave / 4,
                widget.mouseY / -4 + widget.objWave / -4),
            child: GifImage(
              image: const AssetImage(AssetsPath.gifVirus),
              controller: controller,
            ),
          ),
        ),
        AnimatesViruses(
          alignment: Alignment.centerLeft,
          size: Size(width * 1.2, height * 1.2),
          targetOffset: Offset(0, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath5)[1],
          duration: 15000,
          opacity: 1,
          fit: BoxFit.contain,
        ),
        AnimatesViruses(
          size: Size(width * 1.2, height * 1.2),
          targetOffset:
              Offset(0.5 * p2Counter, 0.14 * p2Counter - (mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath5)[0],
          duration: 13000,
          opacity: 1,
          fit: BoxFit.cover,
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
