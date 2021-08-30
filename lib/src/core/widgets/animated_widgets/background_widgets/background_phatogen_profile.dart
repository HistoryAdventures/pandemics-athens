import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_particles_2.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/widgets/gif_contrrol.dart';

import '../../../utils/assets_path.dart';
import '../../../utils/styles.dart';

class BackgroundPhatogenProfile extends StatefulWidget {
  const BackgroundPhatogenProfile();

  @override
  _BackgroundPhatogenProfileState createState() =>
      _BackgroundPhatogenProfileState();
}

class _BackgroundPhatogenProfileState extends State<BackgroundPhatogenProfile>
    with TickerProviderStateMixin {
  late AppLocalizations locales;
  late AnimationController animatinController;
  late Animation<double> animation;
  late GifController controller;
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
    controller = GifController(vsync: this);

    controller.repeat(
      min: 0,
      max: 150,
      period: const Duration(seconds: 4),
      reverse: true,
    );

    animatinController =
        AnimationController(vsync: this, duration: Times.slower)
          ..addStatusListener(_onAnimationStatusChanged)
          ..forward();

    animation = Tween<double>(begin: 0, end: 30).animate(animatinController);
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (!mounted) return;
    if (status == AnimationStatus.completed) {
      if (mounted) animatinController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      if (mounted) animatinController.forward();
    }
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
                const AnimatedParticlesSecond(),
                AnimatedVirusBodies(
                  path: AssetsPath.animatedBack2Vbody0,
                  size: Size(constraints.maxWidth * 0.25,
                      constraints.maxHeight * 0.25),
                  targetOffset: Offset(-offset.dx * 0.02, -offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  top: -100,
                  left: constraints.maxWidth * 0.5,
                  path: AssetsPath.animatedBack2Vbody1,
                  size: Size(constraints.maxWidth * 0.25,
                      constraints.maxHeight * 0.25),
                  targetOffset: Offset(-offset.dx * 0.02, -offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  top: constraints.maxHeight * 0.1,
                  left: constraints.maxWidth * 0.2,
                  path: AssetsPath.animatedBack2Vbody2,
                  size: Size(
                      constraints.maxWidth * 0.2, constraints.maxHeight * 0.2),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0,
                  path: AssetsPath.animatedBack2Vbody3,
                  size: Size(constraints.maxWidth * 0.65,
                      constraints.maxHeight * 0.65),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0.01,
                  left: constraints.maxHeight * 0.55,
                  path: AssetsPath.animatedBack2Vbody4,
                  size: Size(constraints.maxWidth * 0.08,
                      constraints.maxHeight * 0.08),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0.15,
                  left: constraints.maxHeight * 0.5,
                  path: AssetsPath.animatedBack2Vbody5,
                  size: Size(constraints.maxWidth * 0.15,
                      constraints.maxHeight * 0.15),
                  targetOffset: Offset(-offset.dx * 0.02, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: -150,
                  left: constraints.maxWidth * 0.6,
                  path: AssetsPath.animatedBack2Vbody6,
                  size: Size(
                      constraints.maxWidth * 0.3, constraints.maxHeight * 0.3),
                  targetOffset: Offset(-offset.dx * 0.01, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  bottom: constraints.maxHeight * 0.1,
                  right: constraints.maxWidth * 0.15,
                  path: AssetsPath.animatedBack2Vbody7,
                  size: Size(
                      constraints.maxWidth * 0.1, constraints.maxHeight * 0.1),
                  targetOffset: Offset(-offset.dx * 0.01, offset.dy * 0.01),
                ),
                AnimatedVirusBodies(
                  top: constraints.maxHeight * 0.2,
                  right: constraints.maxWidth * 0.05,
                  path: AssetsPath.animatedBack2Vbody8,
                  size: Size(
                      constraints.maxWidth * 0.1, constraints.maxHeight * 0.1),
                  targetOffset: Offset(-offset.dx * 0.01, offset.dy * 0.01),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.25,
                  right: constraints.maxWidth * 0.05,
                  height: constraints.maxHeight * 0.5,
                  width: constraints.maxWidth * 0.5,
                  child: Transform.translate(
                    offset: Offset(offset.dx * 0.02, offset.dy * 0.01),
                    child: GifImage(
                      image: const AssetImage(AssetsPath.gifVirusTyphoid),
                      controller: controller,
                    ),
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
    animatinController.dispose();
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
        AssetsPath.gifBackground2,
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
