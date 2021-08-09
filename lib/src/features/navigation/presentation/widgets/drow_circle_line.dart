
import 'dart:math';

import 'package:flutter/material.dart';

class DrowCircleAndLine extends CustomPainter {
  final Color color;
  final Color currentColor;
  final Offset strat;
  final Offset end;

  DrowCircleAndLine(
      {required this.color,
      required this.strat,
      required this.end,
      required this.currentColor});
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final circleSize = rect.width / 2;
    final area = circleSize * circleSize;
    final radius1 = sqrt(area * 1.5);
    final radius2 = sqrt(area);
    final radius3 = sqrt(area * 0.3);

    final paint1 = Paint()
      ..color = currentColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final paint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final paint3 = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(rect.center, radius1, paint1);
    canvas.drawCircle(rect.center, radius2, paint2);
    canvas.drawCircle(rect.center, radius3, paint3);
    final p1 = strat;
    final p2 = end;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(DrowCircleAndLine oldDelegate) => true;
}