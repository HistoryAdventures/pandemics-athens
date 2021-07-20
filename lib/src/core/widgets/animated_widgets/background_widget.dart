
import 'package:animated_particles/animated_particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../utils/assets_path.dart';

class BackgroundWidget extends StatefulWidget {
  final Offset? offset;
  const BackgroundWidget({this.offset});

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locales;
  late AnimationController animatinController;
  late Animation<double> animation;

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

    animatinController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              GifBackground(
                  size: Size(constraints.maxWidth, constraints.maxHeight)),
              const AnimatedParticles(),
              AnimatedVirusBodies(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                targetOffset: widget.offset,
              ),
            ],
          );
        },
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
        AssetsPath.gifBackground,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AnimatedVirusBodies extends StatelessWidget {
  const AnimatedVirusBodies({
    Key? key,
    required this.targetOffset,
    required this.size,
  }) : super(key: key);

  final Offset? targetOffset;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Transform.translate(
        offset: targetOffset == null
            ? const Offset(0, 0)
            : Offset(-targetOffset!.dx * 0.01, 0),
        child: Image.asset(
          AssetsPath.spheresBackImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
