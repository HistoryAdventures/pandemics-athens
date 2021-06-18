import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:history_of_adventures/src/core/utils/raw_ketboard_listener.dart';
import 'package:vector_math/vector_math_64.dart' as math64;

class Scrapboard<T> extends StatefulWidget {
  const Scrapboard({
    Key? key,
    this.startOffset = Offset.zero,
    required this.child,
  }) : super(key: key);

  final Offset startOffset;
  final Widget child;

  @override
  ScrapboardState createState() => ScrapboardState<T>();
}

class ScrapboardState<T> extends State<Scrapboard<T>>
    with RawKeyboardListenerMixin {
  double kBoardHeight = 1200;
  double kBoardWidth = 1200 * 1.33;

  final TransformationController _transformController =
      TransformationController();

  @override
  bool get enableKeyListener => true;

  @override
  void initState() {
    super.initState();

    // Respect a startOffset so parent widgets can control the initial positition of the InteractiveViewer
    // Respect a startOffset so parent widgets can control the initial position of the InteractiveViewer
    _transformController.value = Matrix4.translation(
      math64.Vector3(widget.startOffset.dx, widget.startOffset.dy, 0),
    );
    _transformController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _transformController,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      minScale: 0.5,
      maxScale: 3,
      constrained: false,
      child: SizedBox(
        width: kBoardWidth,
        height: kBoardHeight,
        child: widget.child,
      ),
    );
  }
}
