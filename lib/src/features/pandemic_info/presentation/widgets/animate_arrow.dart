import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class AnimatedLine extends StatefulWidget {
  final BoxConstraints constraints;

  const AnimatedLine({Key? key, required this.constraints}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  double? _progress;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = Tween(begin: 0.5, end: 1.0).animate(controller)
      ..addListener(() {
        if (mounted) {
          setState(() {
            //print(animation.value);
            _progress = animation.value;
          });
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (_progress != null) {
      return SizedBox(
        height: 15,
        width: 15,
        child: CustomPaint(
          painter: AnimatedLinePainter(
            constraints: widget.constraints,
            progress: _progress!,
          ),
        ),
      );
    }
    return Container();
  }
}

class AnimatedLinePainter extends CustomPainter {
  double progress;
  Paint? paints;
  BoxConstraints constraints;

  AnimatedLinePainter({required this.progress, required this.constraints});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final circleSize = rect.width / 2;
    final area = circleSize * circleSize;
    final radius1 = sqrt(area);
    paints = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final paint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Path arc;
    arc = Path();
    arc.moveTo(constraints.maxWidth * 0.4, constraints.maxHeight * 0.8);
    arc.arcToPoint(
        Offset(
          constraints.maxWidth * 0.8 * progress,
          constraints.maxHeight * 0.1 * progress,
        ),
        radius: const Radius.circular(2000));
    arc = ArrowPath.make(path: arc);
    canvas.drawCircle(
        Offset(constraints.maxWidth * 0.4, constraints.maxHeight * 0.8),
        radius1,
        paint1);
    canvas.drawPath(arc, paints!);
  }

  @override
  bool shouldRepaint(AnimatedLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
