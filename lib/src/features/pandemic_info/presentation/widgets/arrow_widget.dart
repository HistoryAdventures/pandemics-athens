import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  final BoxConstraints constraints;

  const Line({Key? key, required this.constraints}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      width: 15,
      child: CustomPaint(
        painter: LinePainter(
          constraints: widget.constraints,
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  Paint? paints;
  BoxConstraints constraints;

  LinePainter({required this.constraints});

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
          constraints.maxWidth * 0.42,
          constraints.maxHeight * 0.76,
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
  bool shouldRepaint(LinePainter oldDelegate) {
    return true;
  }
}
