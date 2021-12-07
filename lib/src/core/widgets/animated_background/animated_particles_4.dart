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

class AnimatedParticlesForth extends StatefulWidget {
  final BoxConstraints constraints;
  final double mouseY;
  final double mouseX;
  final double objWave;
  const AnimatedParticlesForth({
    Key? key,
    required this.constraints,
    required this.mouseY,
    required this.mouseX,
    required this.objWave,
  }) : super(key: key);

  @override
  _AnimatedParticlesForthState createState() => _AnimatedParticlesForthState();
}

class _AnimatedParticlesForthState extends State<AnimatedParticlesForth> {
  int p2Counter = 0;

  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      AssetsPath.gifBackground4,
      (int id) => html.ImageElement()
        // ignore: unsafe_html
        ..src = AssetsPath.gifBackground4
        ..width = widget.constraints.maxWidth.toInt()
        ..height = widget.constraints.maxHeight.toInt()
        ..style.border = 'none',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HtmlElementView(viewType: AssetsPath.gifBackground4),
        AnimatesViruses(
          size: Size(width * 2, height * 2),
          targetOffset: Offset(0.25 * p2Counter - width - widget.mouseX / 6,
              0.14 * p2Counter - height - (widget.mouseY / 6)),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath4)[1],
          duration: 17000,
          opacity: 1,
          fit: BoxFit.cover,
        ),
        AnimatedVirusBodies(
          left: -0.052 * widget.constraints.maxWidth,
          top: -0.092 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody0,
          size: Size(0.244 * widget.constraints.maxWidth,
              0.745 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.041 * widget.constraints.maxWidth,
          top: -0.092 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody1,
          size: Size(0.309 * widget.constraints.maxWidth,
              0.353 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / 4,
              widget.mouseY / -4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: -0.057 * widget.constraints.maxWidth,
          bottom: -100,
          path: AssetsPath.animatedBack4Vbody4,
          size: Size(0.3 * widget.constraints.maxWidth,
              0.2925 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: -0.052 * widget.constraints.maxWidth,
          bottom: 0.61 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody2,
          size: Size(0.18 * widget.constraints.maxWidth,
              0.28 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.132 * widget.constraints.maxWidth,
          top: 0.805 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody3,
          size: Size(0.055 * widget.constraints.maxWidth,
              0.094 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatesViruses(
          size: Size(width * 2, height * 2),
          targetOffset: Offset(
              0.25 * p2Counter - width - widget.mouseX / 6, widget.mouseY / 6),
          path: IAppAssets().getAssetPaths(BackgroundPaths.backgroundPath4)[0],
          duration: 15000,
          opacity: 1,
          fit: BoxFit.cover,
        ),
        AnimatedVirusBodies(
          left: 0.47 * widget.constraints.maxWidth,
          top: 0.89 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody5,
          size: Size(0.77 * widget.constraints.maxWidth,
              0.137 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / 4,
              widget.mouseY / 4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.67 * widget.constraints.maxWidth,
          top: 0.68 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody6,
          size: Size(0.39 * widget.constraints.maxWidth,
              0.436 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / -4 + widget.objWave / 4),
        ),
        AnimatedVirusBodies(
          left: 0.64 * widget.constraints.maxWidth,
          top: 0.56 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody7,
          size: Size(0.176 * widget.constraints.maxWidth,
              0.289 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.55 * widget.constraints.maxWidth,
          top: 0.32 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody8,
          size: Size(0.063 * widget.constraints.maxWidth,
              0.107 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / -4,
              widget.mouseY / -4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.904 * widget.constraints.maxWidth,
          top: 0.055 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody9,
          size: Size(0.105 * widget.constraints.maxWidth,
              0.269 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / -4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
        AnimatedVirusBodies(
          left: 0.829 * widget.constraints.maxWidth,
          top: -0.081 * widget.constraints.maxHeight,
          path: AssetsPath.animatedBack4Vbody10,
          size: Size(0.105 * widget.constraints.maxWidth,
              0.188 * widget.constraints.maxHeight),
          targetOffset: Offset(widget.mouseX / 4 + widget.objWave / -4,
              widget.mouseY / 4 + widget.objWave / -4),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    super.didChangeDependencies();
  }
}
