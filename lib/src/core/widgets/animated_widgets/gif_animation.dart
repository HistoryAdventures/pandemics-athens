library gif_ani;

import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class GifAnimationController extends AnimationController {
  final int frameCount;
  GifAnimationController(
      {required this.frameCount,
      required TickerProvider vsync,
      double? value,
      Duration? duration,
      String? debugLabel,
      double? lowerBound,
      double? upperBound,
      AnimationBehavior? animationBehavior})
      : super(
            value: value,
            duration: duration,
            debugLabel: debugLabel,
            lowerBound: lowerBound ?? 0.0,
            upperBound: upperBound ?? 1.0,
            animationBehavior: animationBehavior ?? AnimationBehavior.normal,
            vsync: vsync);

  void runAni() {
    forward(from: 0.0);
  }

  void setFrame([int index = 0]) {
    if (index < 0) {
      index = 0;
    } else if (index > frameCount - 1) {
      index = index - 1;
    }
    final double target = index / frameCount;

    animateTo(target, duration: const Duration());
  }
}

class GifAnimation extends StatefulWidget {
  const GifAnimation({
    required this.image,
    required this.controller,
    required this.imageInfo,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
  });
  final GifAnimationController controller;
  final ImageProvider image;
  final List<ImageInfo> imageInfo;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  @override
  State<StatefulWidget> createState() {
    return _AnimatedImageState();
  }
}

class _AnimatedImageState extends State<GifAnimation> {
  late Tween<double> _tween;
  late List<ImageInfo>? _infos;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(
        begin: 0.0, end: (widget.controller.frameCount - 1) * 1.0);
    widget.controller.addListener(_listener);
    //init();
    _infos = widget.imageInfo;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_listener);
  }

  @override
  void didUpdateWidget(GifAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_listener);
      widget.controller.addListener(_listener);
    }
  }

  void _listener() {
    int _idx = _tween.evaluate(widget.controller) ~/ 1;

    if (_idx >= widget.controller.frameCount) {
      _idx = widget.controller.frameCount - 1;
    }
    if (_curIndex != _idx) {
      setState(() {
        _curIndex = _idx;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //init();
  }

  // Future init() async {
  //   final listImageInfo = await preloadImage(
  //       provider: widget.image,
  //       context: context,
  //       frameCount: widget.controller.frameCount);
  //   print('$listImageInfo');
  //   if (mounted) {
  //     setState(() {
  //       _infos = listImageInfo;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final RawImage image = RawImage(
      image: _infos?[_curIndex].image,
      width: widget.width,
      height: widget.height,
      scale: _infos?[_curIndex].scale ?? 1.0,
      color: widget.color,
      colorBlendMode: widget.colorBlendMode,
      fit: widget.fit,
      alignment: widget.alignment,
      repeat: widget.repeat,
      centerSlice: widget.centerSlice,
      matchTextDirection: widget.matchTextDirection,
    );
    if (widget.excludeFromSemantics) return image;
    return Semantics(
      container: widget.semanticLabel != null,
      image: true,
      label: widget.semanticLabel ?? '',
      child: image,
    );
  }
}

// Future<List<ImageInfo>> preloadImage({
//   required ImageProvider provider,
//   required BuildContext context,
//   int frameCount = 1,
//   Size? size,
//   ImageErrorListener? onError,
// }) async {
//   final ImageConfiguration config =
//       createLocalImageConfiguration(context, size: size);
//   final Completer<List<ImageInfo>> completer = Completer<List<ImageInfo>>();
//   final ImageStream stream = provider.resolve(config);
//   final List<ImageInfo> ret = [];

//   final ImageStreamListener imageStreamListener =
//       ImageStreamListener((ImageInfo image, bool sync) {
//     ret.add(image);
//     if (ret.length == frameCount) {
//       print("object");
//       completer.complete(ret);
//     }
//   });

//   stream.addListener(imageStreamListener);
//   completer.future.then((List<ImageInfo> _) {
//     stream.removeListener(imageStreamListener);
//   });

//   return completer.future;
// }
