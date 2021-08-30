import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_particles_2.dart';
import 'package:history_of_adventures/src/features/animated_background/animated_particles_5.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/widgets/gif_contrrol.dart';

import '../../../utils/assets_path.dart';
import '../../../utils/styles.dart';

class BackgroundDeadOfSocratesPage extends StatefulWidget {
  const BackgroundDeadOfSocratesPage();

  @override
  _BackgroundDeadOfSocratesPageState createState() =>
      _BackgroundDeadOfSocratesPageState();
}

class _BackgroundDeadOfSocratesPageState
    extends State<BackgroundDeadOfSocratesPage> with TickerProviderStateMixin {
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
              children: [],
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
        AssetsPath.gifBackground5,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AnimatedVirusBodies extends StatelessWidget {
  AnimatedVirusBodies(
      {Key? key,
      required this.targetOffset,
      required this.size,
      this.left,
      this.right,
      this.bottom,
      this.alignment,
      this.top,
      required this.path})
      : super(key: key);

  final Offset? targetOffset;
  final Size size;
  final String path;
  final double? left;
  final double? top;
  final Alignment? alignment;
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
            alignment: alignment ?? Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
