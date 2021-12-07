// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/assets_path.dart';
import '../../utils/styles.dart';
import 'animated_viruses.dart';
import 'animatied_virus_bodies.dart';
import 'app_assets.dart';

class AnimatedParticlesSixth extends StatefulWidget {
  final BoxConstraints constraints;
  final double mouseY;
  final double mouseX;
  final double objWave;
  final Offset offset;
  const AnimatedParticlesSixth({
    Key? key,
    required this.constraints,
    required this.mouseY,
    required this.mouseX,
    required this.objWave,
    required this.offset,
  }) : super(key: key);

  @override
  _AnimatedParticlesSixthState createState() => _AnimatedParticlesSixthState();
}

class _AnimatedParticlesSixthState extends State<AnimatedParticlesSixth> {
  int p1Counter = 0, p2Counter = 0;

  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      AssetsPath.gifBackground6,
      (int id) => html.ImageElement()
        ..style.border = 'none'
        // ignore: unsafe_html
        ..src = AssetsPath.gifBackground6
        ..width = widget.constraints.maxWidth.toInt()
        ..height = widget.constraints.maxHeight.toInt(),
    );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      AssetsPath.gifVirus,
      (int id) => html.ImageElement()
        ..style.border = 'none'
        // ignore: unsafe_html
        ..src = AssetsPath.gifVirus
        ..style.objectFit = 'contain'
        ..height = (widget.constraints.maxHeight * 0.55).toInt()
        ..width = (widget.constraints.maxWidth * 0.55).toInt(),
    );
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
        const HtmlElementView(viewType: AssetsPath.gifBackground6),
        AnimatesViruses(
          size: Size(width * 2, height * 2),
          targetOffset: Offset(
            -0.25 * p2Counter - widget.mouseX / 6,
            0.14 * p2Counter - height - (widget.mouseY / 6),
          ),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath6)[1],
          duration: 12000,
          opacity: 1,
          fit: BoxFit.cover,
        ),
        AnimatedVirusBodies(
          left: 0.7958 * widget.constraints.maxWidth,
          top: 0.2916 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody0,
          size: Size(
            0.1447 * widget.constraints.maxWidth,
            0.2694 * widget.constraints.maxHeight,
          ),
          targetOffset: Offset(
            widget.mouseX / -4 + widget.objWave / -4,
            widget.mouseY / 4 + widget.objWave / 4,
          ),
        ),
        AnimatedVirusBodies(
          left: 0.819 * widget.constraints.maxWidth,
          top: 0.891 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody1,
          size: Size(
            0.126 * widget.constraints.maxWidth,
            0.206 * widget.constraints.maxHeight,
          ),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / 4,
              widget.mouseY / -4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.38 * widget.constraints.maxWidth,
          top: 0.562 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody2,
          size: Size(0.4875 * widget.constraints.maxWidth,
              0.534 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / -4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.092 * widget.constraints.maxWidth,
          top: 0.84 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody3,
          size: Size(0.192 * widget.constraints.maxWidth,
              0.245 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: -0.052 * widget.constraints.maxWidth,
          top: 0.231 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody4,
          size: Size(0.35 * widget.constraints.maxWidth,
              0.71 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.025 * widget.constraints.maxWidth,
          top: 0.044 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody5,
          size: Size(0.063 * widget.constraints.maxWidth,
              0.107 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.086 * widget.constraints.maxWidth,
          top: -0.0833 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody6,
          size: Size(0.1755 * widget.constraints.maxWidth,
              0.288 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / -4 + widget.objWave / 4),
        ),
        AnimatesViruses(
          size: Size(width * 2, height * 2),
          targetOffset:
              Offset(widget.mouseX / 6, -0.25 - p2Counter - widget.mouseY / 6),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath4)[0],
          duration: 15000,
          opacity: 1,
          fit: BoxFit.cover,
        ),
        AnimatedVirusBodies(
          left: 0.205 * widget.constraints.maxWidth,
          top: -0.092 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody7,
          size: Size(0.438 * widget.constraints.maxWidth,
              0.253 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.281 * widget.constraints.maxWidth,
          top: 0.21 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody8,
          size: Size(0.094 * widget.constraints.maxWidth,
              0.1629 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.39 * widget.constraints.maxWidth,
          top: 0.235 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody9,
          size: Size(0.047 * widget.constraints.maxWidth,
              0.1083 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.938 * widget.constraints.maxWidth,
          top: 0.062 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack6Vbody10,
          size: Size(0.0875 * widget.constraints.maxWidth,
              0.1564 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
        Positioned(
          top: widget.constraints.maxHeight * 0.25,
          right: 0,
          height: widget.constraints.maxHeight * 0.55,
          width: widget.constraints.maxWidth * 0.55,
          child: Transform.translate(
            offset: Offset(widget.offset.dx * 0.02, widget.offset.dy * 0.01),
            child: const HtmlElementView(viewType: AssetsPath.gifVirus),
          ),
        ),
      ],
    );
  }
}
