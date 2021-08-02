import 'dart:math';

import 'package:flutter/material.dart';

class NavigationTree extends StatelessWidget {
  final double left;
  final double top;
  final Offset start;
  final Offset end;
  //final Alignment alignment;

  const NavigationTree(
      {Key? key,
      required this.left,
      required this.top,
      required this.start,
      //required this.alignment,
      required this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: SizedBox(
        //color: AppColors.red,
        child: Row(
          children: [
            const Align(
              alignment: Alignment.bottomRight,
              child: Text('home'),
            ),
            Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: DrowCircleAndLine(
                    color: Colors.white, strat: start, end: end),
                child: const SizedBox(
                  height: 15,
                  width: 15,
                  child: Center(
                    child: Text(
                      '',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrowCircleAndLine extends CustomPainter {
  final Color color;
  final Offset strat;
  final Offset end;

  DrowCircleAndLine(
      {required this.color, required this.strat, required this.end});
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final circleSize = rect.width / 2;
    final area = circleSize * circleSize;
    final radius1 = sqrt(area);
    final radius2 = sqrt(area * 0.3);

    final paint1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final paint2 = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(rect.center, radius1, paint1);
    canvas.drawCircle(rect.center, radius2, paint2);
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
