import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/background_widgets/backgrounds_dead_of_socrates_page.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/gif_contrrol.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_viruses.dart';

import '../../core/utils/styles.dart';
import 'app_assets.dart';

class AnimatedParticlesFive extends StatefulWidget {
  final BoxConstraints constraints;
  final Offset offset;

  const AnimatedParticlesFive({
    Key? key,
    required this.constraints,
    required this.offset,
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
  double width = window.physicalSize.width / window.devicePixelRatio,
      height = window.physicalSize.height / window.devicePixelRatio;
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
                widget.constraints.maxWidth, widget.constraints.maxHeight)),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.1,
          left: widget.constraints.maxWidth * 0.33,
          path: AssetsPath.animatedBack5Vbody5,
          alignment: Alignment.topLeft,
          size: Size(
            widget.constraints.maxWidth * 0.5,
            widget.constraints.maxHeight * 0.5,
          ),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: -widget.constraints.maxHeight * 0.18,
          alignment: Alignment.centerLeft,
          left: widget.constraints.maxWidth * 0.15,
          path: AssetsPath.animatedBack5Vbody8,
          size: Size(widget.constraints.maxWidth * 0.8,
              widget.constraints.maxHeight * 0.8),
          targetOffset:
              Offset(widget.offset.dx * 0.01, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.1,
          right: -50,
          path: AssetsPath.animatedBack5Vbody0,
          alignment: Alignment.centerRight,
          size: Size(widget.constraints.maxWidth * 0.25,
              widget.constraints.maxHeight * 0.25),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.15,
          right: widget.constraints.maxWidth * 0.1,
          path: AssetsPath.animatedBack5Vbody1,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, -widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: 0,
          right: 0,
          alignment: Alignment.centerRight,
          path: AssetsPath.animatedBack5Vbody2,
          size: Size(widget.constraints.maxWidth * 0.5,
              widget.constraints.maxHeight * 0.5),
          targetOffset:
              Offset(widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.05,
          left: widget.constraints.maxWidth * 0.15,
          path: AssetsPath.animatedBack5Vbody0,
          size: Size(widget.constraints.maxWidth * 0.08,
              widget.constraints.maxHeight * 0.08),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: 10,
          right: widget.constraints.maxHeight * 0.5,
          path: AssetsPath.animatedBack5Vbody4,
          size: Size(widget.constraints.maxWidth * 0.08,
              widget.constraints.maxHeight * 0.08),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: -20,
          alignment: Alignment.centerRight,
          left: widget.constraints.maxHeight * 0.8,
          path: AssetsPath.animatedBack5Vbody5,
          size: Size(widget.constraints.maxWidth * 0.15,
              widget.constraints.maxHeight * 0.15),
          targetOffset:
              Offset(-widget.offset.dx * 0.02, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: -10,
          left: widget.constraints.maxWidth * 0.05,
          alignment: Alignment.centerLeft,
          path: AssetsPath.animatedBack5Vbody6,
          size: Size(widget.constraints.maxWidth * 0.3,
              widget.constraints.maxHeight * 0.3),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          bottom: widget.constraints.maxHeight * 0.3,
          left: widget.constraints.maxWidth * 0.13,
          path: AssetsPath.animatedBack5Vbody7,
          alignment: Alignment.centerLeft,
          size: Size(widget.constraints.maxWidth * 0.25,
              widget.constraints.maxHeight * 0.25),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: widget.constraints.maxHeight * 0.3,
          left: widget.constraints.maxWidth * 0.01,
          path: AssetsPath.animatedBack5Vbody10,
          alignment: Alignment.bottomLeft,
          size: Size(widget.constraints.maxWidth * 0.15,
              widget.constraints.maxHeight * 0.15),
          targetOffset:
              Offset(-widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        AnimatedVirusBodies(
          top: -10,
          left: -10,
          path: AssetsPath.animatedBack5Vbody11,
          alignment: Alignment.topLeft,
          size: Size(
            widget.constraints.maxWidth * 0.4,
            widget.constraints.maxHeight * 0.4,
          ),
          targetOffset:
              Offset(widget.offset.dx * 0.01, widget.offset.dy * 0.01),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.01,
          right: widget.constraints.maxWidth * 0.05,
          height: widget.constraints.maxHeight * 0.5,
          width: widget.constraints.maxWidth * 0.5,
          child: Transform.translate(
            offset: Offset(widget.offset.dx * 0.02, widget.offset.dy * 0.01),
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
