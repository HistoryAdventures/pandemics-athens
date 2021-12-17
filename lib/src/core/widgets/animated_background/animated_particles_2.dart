// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/assets_path.dart';
import 'animated_viruses.dart';
import 'animatied_virus_bodies.dart';
import 'app_assets.dart';

class AnimatedParticlesSecond extends StatefulWidget {
  final BoxConstraints constraints;
  final double mouseY;
  final double mouseX;
  final double objWave;

  const AnimatedParticlesSecond({
    Key? key,
    required this.constraints,
    required this.mouseY,
    required this.mouseX,
    required this.objWave,
  }) : super(key: key);

  @override
  _AnimatedParticlesSecondState createState() =>
      _AnimatedParticlesSecondState();
}

class _AnimatedParticlesSecondState extends State<AnimatedParticlesSecond> {
  int p1Counter = 0, p2Counter = 0, p3Counter = 0;
  bool reversed = false;
  double width = ui.window.physicalSize.width / ui.window.devicePixelRatio,
      height = ui.window.physicalSize.height / ui.window.devicePixelRatio;

  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      AssetsPath.gifBackground2,
      (int id) => html.ImageElement()
        ..style.border = 'none'
        // ignore: unsafe_html
        ..src = AssetsPath.gifBackground2
        ..width = widget.constraints.maxWidth.toInt()
        ..height = widget.constraints.maxHeight.toInt(),
    );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      AssetsPath.gifVirusTyphoid,
      (int id) => html.ImageElement()
        ..style.border = 'none'
        // ignore: unsafe_html
        ..src = AssetsPath.gifVirusTyphoid
        ..style.objectFit = 'contain'
        ..height = (widget.constraints.maxHeight * 0.2).toInt()
        ..width = (widget.constraints.maxWidth * 0.2).toInt(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HtmlElementView(viewType: AssetsPath.gifBackground2),
        AnimatesViruses(
          size: Size(width * 1.2, height * 1.2),
          targetOffset: Offset(
            0.25 * p2Counter - (widget.mouseY / 6),
            0.14 * p2Counter - (widget.mouseY / 6),
          ),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath2)[1],
          duration: 15000,
          opacity: 1,
          fit: BoxFit.contain,
        ),
        AnimatedVirusBodies(
          left: -widget.constraints.maxHeight * 0.05,
          top: -widget.constraints.maxWidth * 0.12,
          path: AssetsPath.animatedBack2Vbody0,
          size: Size(
            widget.constraints.maxWidth * 0.306,
            widget.constraints.maxHeight * 0.346,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          top: -widget.constraints.maxHeight * 0.112,
          left: widget.constraints.maxWidth * 0.515,
          path: AssetsPath.animatedBack2Vbody1,
          size: Size(
            widget.constraints.maxWidth * 0.192,
            widget.constraints.maxHeight * 0.267,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxHeight * 0.11,
          top: widget.constraints.maxWidth * 0.203,
          path: AssetsPath.animatedBack2Vbody2,
          size: Size(
            widget.constraints.maxWidth * 0.19,
            widget.constraints.maxHeight * 0.137,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: -widget.constraints.maxHeight * 0.058,
          top: widget.constraints.maxWidth * 0.38,
          path: AssetsPath.animatedBack2Vbody3,
          size: Size(
            widget.constraints.maxWidth * 0.383,
            widget.constraints.maxHeight * 0.75,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxHeight * 0.293,
          top: widget.constraints.maxHeight * 0.898,
          path: AssetsPath.animatedBack2Vbody4,
          size: Size(
            widget.constraints.maxWidth * 0.052,
            widget.constraints.maxHeight * 0.086,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / 4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatesViruses(
          size: Size(width * 1.2, height * 1.2),
          targetOffset: Offset(
            0.25 * p2Counter - (widget.mouseX / 6),
            0.14 * p2Counter - (widget.mouseY / 6),
          ),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath2)[0],
          duration: 13000,
          opacity: 1,
          fit: BoxFit.cover,
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxHeight * 0.281,
          top: widget.constraints.maxHeight * 0.5,
          path: AssetsPath.animatedBack2Vbody5,
          size: Size(
            widget.constraints.maxWidth * 0.15,
            widget.constraints.maxHeight * 0.15,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxWidth * 0.567,
          top: widget.constraints.maxWidth * 0.861,
          path: AssetsPath.animatedBack2Vbody6,
          size: Size(
            widget.constraints.maxWidth * 0.391,
            widget.constraints.maxHeight * 0.288,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxHeight * 0.767,
          top: widget.constraints.maxWidth * 0.774,
          path: AssetsPath.animatedBack2Vbody7,
          size: Size(
            widget.constraints.maxWidth * 0.116,
            widget.constraints.maxHeight * 0.08,
          ),
          targetOffset: Offset(
            widget.mouseX / 4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        AnimatedVirusBodies(
          left: widget.constraints.maxHeight * 0.906,
          top: widget.constraints.maxWidth * 0.342,
          path: AssetsPath.animatedBack2Vbody8,
          size: Size(
            widget.constraints.maxWidth * 0.075,
            widget.constraints.maxHeight * 0.123,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / -4 + widget.objWave / -4,
          ),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.3,
          right: widget.constraints.maxWidth * 0.05,
          height: widget.constraints.maxHeight * 0.28,
          width: widget.constraints.maxWidth * 0.4,
          child: Transform.translate(
            offset: Offset(
              widget.mouseX / -4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / 4,
            ),
            child: const HtmlElementView(viewType: AssetsPath.gifVirusTyphoid),
          ),
        ),
      ],
    );
  }
}
