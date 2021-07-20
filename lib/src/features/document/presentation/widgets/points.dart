import 'dart:math';

import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  final String text;
  final Color color;
  const PointWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PulsePainter(color),
      child: SizedBox(
        height: 30,
        width: 30,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PulsePainter extends CustomPainter {
  final Color color;

  PulsePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final circleSize = rect.width / 2;
    final area = circleSize * circleSize;
    final radius1 = sqrt(area);
    final radius2 = sqrt(area * 0.7);
    // final opacity = 1.0 - (_animation.value).clamp(0.0, 1.0);
    final paint1 = Paint()
          ..color = Colors.white
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
        //..color.withOpacity(opacity)
        ;
    final paint2 = Paint()
          ..color = color
          ..strokeWidth = 1
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round

        //..color.withOpacity(opacity)
        ;
    canvas.drawCircle(rect.center, radius1, paint1);
    canvas.drawCircle(rect.center, radius2, paint2);
  }

  @override
  bool shouldRepaint(PulsePainter oldDelegate) => true;
}
