import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/animated_background/animated_particles_1.dart';
import '../../../utils/assets_path.dart';
import '../../../utils/styles.dart';
import '../gif_animation.dart';

class BackgroundLeandingPage extends StatefulWidget {
  //final List<ImageInfo> imageinfo;

  // const BackgroundLeandingPage({Key? key, required this.imageinfo})
  //     : super(key: key);

  @override
  _BackgroundLeandingPageState createState() => _BackgroundLeandingPageState();
}

class _BackgroundLeandingPageState extends State<BackgroundLeandingPage>
    with TickerProviderStateMixin {
  late AppLocalizations locales;
  // late AnimationController animatinController;
  // late Animation<double> animation;
  late GifAnimationController controller;
  Offset offset = const Offset(0, 0);

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  bool isVideoLoaded = false;
  bool isImageloaded = false;

  @override
  void initState() {
    super.initState();
    controller = GifAnimationController(
        vsync: this, frameCount: 180, duration: const Duration(seconds: 10));

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (e) {
          setState(() {
            offset = e.position;
          });
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                GifBackground(
                    size: Size(constraints.maxWidth, constraints.maxHeight)),
                const AnimatedParticlesFirst(),
                AnimatedVirusBodies(
                  right: 0,
                  top: constraints.maxHeight * 0.3,
                  path: AssetsPath.animatedBack1Vbody0,
                  size: Size(
                      constraints.maxWidth * 0.1, constraints.maxHeight * 0.25),
                  targetOffset: Offset(-offset.dx * 0.02, -offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  top: 0,
                  right: -150,
                  path: AssetsPath.animatedBack1Vbody1,
                  size: Size(
                      constraints.maxWidth * 0.4, constraints.maxHeight * 0.4),
                  targetOffset: Offset(-offset.dx * 0.02, -offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  top: constraints.maxHeight * 0.1,
                  right: constraints.maxWidth * 0.3,
                  path: AssetsPath.animatedBack1Vbody2,
                  size: Size(
                      constraints.maxWidth * 0.1, constraints.maxHeight * 0.1),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  top: constraints.maxHeight * 0.15,
                  right: constraints.maxWidth * 0.3,
                  path: AssetsPath.animatedBack1Vbody3,
                  size: Size(
                      constraints.maxWidth * 0.2, constraints.maxHeight * 0.2),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxHeight * 0.2,
                  path: AssetsPath.animatedBack1Vbody5,
                  size: Size(constraints.maxWidth * 0.35,
                      constraints.maxHeight * 0.35),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: 0,
                  left: 0,
                  path: AssetsPath.animatedBack1Vbody6,
                  size: Size(
                      constraints.maxWidth * 0.4, constraints.maxHeight * 0.4),
                  targetOffset: Offset(-offset.dx * 0.01, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0.1,
                  right: constraints.maxWidth * 0.9,
                  path: AssetsPath.animatedBack1Vbody7,
                  size: Size(
                      constraints.maxWidth * 0.3, constraints.maxHeight * 0.3),
                  targetOffset: Offset(-offset.dx * 0.01, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0.1,
                  left: constraints.maxHeight * 0.25,
                  path: AssetsPath.animatedBack1Vbody4,
                  size: Size(constraints.maxWidth * 0.08,
                      constraints.maxHeight * 0.08),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: -50,
                  left: constraints.maxWidth * 0.25,
                  path: AssetsPath.animatedBack1Vbody8,
                  size: Size(
                      constraints.maxWidth * 0.3, constraints.maxHeight * 0.3),
                  targetOffset: Offset(-offset.dx * 0.01, offset.dy * 0.01),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.25,
                  right: 0,
                  height: constraints.maxHeight * 0.55,
                  width: constraints.maxWidth * 0.55,
                  child: Transform.translate(
                    offset: Offset(offset.dx * 0.02, offset.dy * 0.01),
                    child: Image.asset(AssetsPath.gifVirus),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    /// animatinController.dispose();
    super.dispose();
  }
}

class GifBackground extends StatelessWidget {
  final Size size;
  const GifBackground({
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Image.asset(
        AssetsPath.gifBackground1,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AnimatedVirusBodies extends StatelessWidget {
  const AnimatedVirusBodies(
      {Key? key,
      required this.targetOffset,
      required this.size,
      this.left,
      this.right,
      this.bottom,
      this.top,
      required this.path})
      : super(key: key);

  final Offset? targetOffset;
  final Size size;
  final String path;
  final double? left;
  final double? top;
  final double? bottom;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Transform.translate(
          offset: targetOffset!,
          child: Image.asset(
            path,
            alignment: Alignment.centerLeft,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
