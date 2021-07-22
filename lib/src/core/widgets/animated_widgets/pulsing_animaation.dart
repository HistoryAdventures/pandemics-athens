import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
//import 'package:photobooth_ui/photobooth_ui.dart';

/// Default duration for a single pulse animation.
const defaultPulseDuration = Times.slowest;

/// Default duration for the time between pulse animations.
const defaultTimeBetweenPulses = Times.slow;

/// {@template animated_pulse}
/// Widget that applies a pulse animation to its child.
/// {@endtemplate}
class AnimatedPulse extends StatefulWidget {
  /// {@macro animated_pulse}
  const AnimatedPulse({
    Key? key,
    this.pulseDuration = defaultPulseDuration,
    this.timeBetweenPulses = defaultTimeBetweenPulses,
    required this.child,
  }) : super(key: key);

  /// [Widget] that will have the pulse animation
  final Widget child;

  /// The duration of a single pulse animation.
  final Duration pulseDuration;

  /// The duration of the time between pulse animations.
  final Duration timeBetweenPulses;

  @override
  _AnimatedPulseState createState() => _AnimatedPulseState();
}

class _AnimatedPulseState extends State<AnimatedPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.pulseDuration)
          ..addStatusListener(_onAnimationStatusChanged)
          ..forward();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (!mounted) return;
    if (status == AnimationStatus.completed) {
      _timer = Timer(widget.timeBetweenPulses, () {
        if (mounted) _controller.forward(from: 0);
      });
    }
  }

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_onAnimationStatusChanged)
      ..dispose();
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PulsePainter(_controller),
      child: widget.child,
    );
  }
}

/// {@template pulse_painter}
/// Painter for the pulse animation
/// {@endtemplate}
class PulsePainter extends CustomPainter {
  /// {@macro pulse_painter}
  const PulsePainter(this._animation) : super(repaint: _animation);

  final Animation<double> _animation;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final circleSize = rect.width / 2;
    final area = circleSize * circleSize;
    final radius1 = sqrt(area * _animation.value * 3);
    final radius2 = sqrt(area * _animation.value * 5);
    final opacity = 1.0 - (_animation.value).clamp(0.0, 1.0);
    final paint1 = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color.withOpacity(opacity);
    final paint2 = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color.withOpacity(opacity);
    canvas.drawCircle(rect.center, radius1, paint1);
    canvas.drawCircle(rect.center, radius2, paint2);
  }

  @override
  bool shouldRepaint(PulsePainter oldDelegate) => true;
}
