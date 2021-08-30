import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_viruses.dart';

import '../../core/utils/styles.dart';
import 'app_assets.dart';

class AnimatedParticlesFirst extends StatefulWidget {
  const AnimatedParticlesFirst({Key? key}) : super(key: key);

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
