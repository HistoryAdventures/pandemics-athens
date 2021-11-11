import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:path_drawing/path_drawing.dart';

class MyPainter extends CustomPainter {
  final Offset startOffset;
  final Offset endOffset;
  bool shouldPaint;
  final List<Line> lines;
  final QuizItem quizItem;
  final double circleButtonWidth;
  final bool accepted;
  final List<LineToSave> savedLines;
  double distance = 0;
  double diferent = 0;
  double smallScreenWidthFactor;
  double smallScreenHeightFactor;
  Paint painter = Paint();
  final bool checked;
  static Offset curveChangingOffset = Offset(0, 0);
  List<RightLine> rightLines = [];
  final CircularIntervalList<double> intervalList =
      CircularIntervalList<double>(<double>[15.0, 10.5]);
  final Color grey = Color.fromRGBO(161, 161, 161, 1);

  double xFactor = 50;
  double yFactor = 50;

  MyPainter({
    required this.startOffset,
    required this.endOffset,
    required this.shouldPaint,
    required this.lines,
    required this.quizItem,
    required this.circleButtonWidth,
    required this.accepted,
    required this.savedLines,
    required this.smallScreenWidthFactor,
    required this.smallScreenHeightFactor,
    required this.checked,
    required this.rightLines,
  });
  Path path = Path();
  Paint paintValue = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.grey
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    drawCurentLine(
      canvas: canvas,
      path: path,
      startOffset: startOffset,
      endOffset: endOffset,
      accepted: accepted,
      paint: paint,
      rightLine: false,
    );

    rightLines.forEach((element) {
      Paint paint = Paint()
        ..color = grey
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;

      if (checked) {
        drawCurentLine(
          canvas: canvas,
          path: path,
          startOffset: offsetForKey(element.startKey),
          endOffset: offsetForKey(element.endKey),
          accepted: false,
          paint: paint,
          rightLine: true,
        );
      }
    });

    savedLines.forEach((element) {
      Paint paint = Paint()
        ..color = element.color
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;
      drawCurentLine(
        canvas: canvas,
        path: path,
        startOffset: offsetForKey(element.line.startKey),
        endOffset: offsetForKey(element.line.endKey),
        accepted: false,
        paint: paint,
        rightLine: false,
      );
    });
  }

  void drawCurentLine({
    required Canvas canvas,
    required Path path,
    required Paint paint,
    required Offset startOffset,
    required Offset endOffset,
    required bool accepted,
    required bool rightLine,
  }) {
    Path path = Path();
    path.moveTo(startOffset.dx, startOffset.dy);

    if (!accepted) {
      if (!pointInSameLine(startOffset, endOffset)) {
        path.cubicTo(
          quadraticLeftPoint(startOffset, endOffset).dx,
          quadraticLeftPoint(startOffset, endOffset).dy,
          quadraticRightPoint(startOffset, endOffset).dx,
          quadraticRightPoint(startOffset, endOffset).dy,
          endOffset.dx,
          endOffset.dy,
        );
      } else {
        path.lineTo(endOffset.dx, endOffset.dy);
      }
    } else {
      if (!pointInSameLine(startOffset, endOffset)) {
        path.quadraticBezierTo(
          getCurentLineControllPoint(startOffset, endOffset).dx,
          getCurentLineControllPoint(startOffset, endOffset).dy,
          endOffset.dx,
          endOffset.dy,
        );
      } else {
        path.lineTo(endOffset.dx, endOffset.dy);
      }
    }
    canvas.drawPath(
      rightLine
          ? dashPath(
              path,
              dashArray: intervalList,
            )
          : path,
      paint,
    );
  }

  Offset quadraticLeftPoint(
    Offset startOffset,
    Offset endOffset,
  ) {
    if (endOffset.dy > startOffset.dy) {
      return Offset(
        startOffset.dx + 50,
        startOffset.dy - 50,
      );
    } else {
      return Offset(
        startOffset.dx + 50,
        startOffset.dy + 50,
      );
    }
  }

  Offset quadraticRightPoint(
    Offset startOffset,
    Offset endOffset,
  ) {
    if (endOffset.dy > startOffset.dy) {
      return Offset(
        endOffset.dx - 50,
        endOffset.dy + 50,
      );
    } else {
      return Offset(
        endOffset.dx - 50,
        endOffset.dy - 50,
      );
    }
  }

  double xFactorValue(
    Offset startOffset,
    Offset endOffset,
  ) {
    return distanceX(startOffset, endOffset) / 3;
  }

  double yFactorValue(
    Offset startOffset,
    Offset endOffset,
  ) {
    return distanceY(startOffset, endOffset) / 3;
  }

  bool pointInSameLine(Offset startOffset, Offset endOffset) {
    return distanceY(startOffset, endOffset) < 10;
  }

  Offset getCurentLineControllPoint(Offset startOffse, Offset endOffset,
      {bool forCubic = false}) {
    Offset offset = Offset.zero;
    if (endOffset.dy > startOffset.dy) {
      offset = Offset(startOffse.dx + xFactorValue(startOffse, endOffset),
          endOffset.dy + yFactorValue(startOffse, endOffset));
    } else {
      offset = Offset(startOffse.dx + xFactorValue(startOffse, endOffset),
          endOffset.dy - yFactorValue(startOffse, endOffset));
    }
    return offset;
  }

  Offset getCurrentLineRightControllPoint(
    Offset startOffset,
    Offset endOffset,
  ) {
    Offset offset = Offset.zero;
    if (endOffset.dy > startOffset.dy) {
      offset = Offset(
        endOffset.dx - xFactorValue(startOffset, endOffset),
        endOffset.dy + yFactorValue(startOffset, endOffset),
      );
    } else {
      offset = Offset(
        endOffset.dx - xFactorValue(startOffset, endOffset),
        endOffset.dy - yFactorValue(startOffset, endOffset),
      );
    }
    return offset;
  }

  double distanceX(Offset a, Offset b) {
    return (a.dx - b.dx).abs();
  }

  double distanceY(Offset a, Offset b) {
    return (a.dy - b.dy).abs();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Offset offsetForKey(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset(
      smallScreenWidthFactor * -1,
      smallScreenHeightFactor * -1,
    )); //this is global position
    double y = position.dy + circleButtonWidth / 2;
    double x = position.dx + circleButtonWidth / 2;
    return Offset(x, y);
  }
}
