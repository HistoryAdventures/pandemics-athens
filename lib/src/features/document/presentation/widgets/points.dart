import 'dart:math';

import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

import '../../../../core/utils/assets_path.dart';

class PointWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double? width;
  const PointWidget({
    Key? key,
    required this.text,
    required this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPaint(
          painter: PulsePainter(color),
          child: SizedBox(
            height: HW.getWidth(width ?? 30, context),
            width: HW.getWidth(width ?? 30, context),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: HW.getHeight(10, context),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            height: 7,
            width: 7,
            child: Image.asset(AssetsPath.poitButtonArrowRight)),
      ],
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
    final radius1 = sqrt(area * 1.2);
    final radius2 = sqrt(area);
    // final opacity = 1.0 - (_animation.value).clamp(0.0, 1.0);
    final paint1 = Paint()
          ..color = Colors.white
          ..strokeWidth = 2
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
