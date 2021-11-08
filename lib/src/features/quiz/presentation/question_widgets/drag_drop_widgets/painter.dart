import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';

class MyPainter extends CustomPainter {
  final Offset startOffset;
  final Offset endOffset;
  final bool shouldPaint;
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

  static Offset curveChangingOffset = Offset(0, 0);

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
  });
  @override
  void paint(Canvas canvas, Size size) {
    distance = offsetForKey(quizItem.target.key).dx -
        offsetForKey(quizItem.question.key).dx;
    Path path = Path();

    painter = Paint()
      ..strokeWidth = 1
      ..color = const Color.fromRGBO(161, 161, 161, 1)
      ..style = PaintingStyle.stroke;
    if (!shouldPaint) return;

    if (savedLines.length != 3) {
      drawCurentLineBeforeAccepting(canvas: canvas, path: path, paint: painter);
      drawCurentLineAfterAcceptiong(canvas: canvas, path: path, paint: painter);
    }
    drawSavedLines(canvas: canvas, path: path, painte: painter);
  }

  void drawCurentLineBeforeAccepting({
    required Canvas canvas,
    required Path path,
    required Paint paint,
  }) {
    if (accepted) {
      path.moveTo(startOffset.dx, startOffset.dy);
      if (endOffset.dx - startOffset.dx > 50) {
        diferent = (endOffset.dx - startOffset.dx);

        if (diferent < distance / 3) {
          path.quadraticBezierTo(
              controllX(startOffset.dx, endOffset.dx),
              controllY(startOffset.dy, endOffset.dy),
              endOffset.dx,
              endOffset.dy);

          curveChangingOffset = endOffset;
        } else {
          path.quadraticBezierTo(
              controllX(startOffset.dx, endOffset.dx),
              controllY(startOffset.dy, endOffset.dy),
              endOffset.dx,
              endOffset.dy);

          double newCurveY;
          if (endOffset.dy > startOffset.dy) {
            newCurveY = startOffset.dy +
                (endOffset.dy - curveChangingOffset.dy).abs() / 1.2;
          } else {
            newCurveY = startOffset.dy -
                (endOffset.dy - curveChangingOffset.dy).abs() / 1.2;
          }
          curveChangingOffset = Offset(
            startOffset.dx + ((endOffset.dx - startOffset.dx) / 2),
            newCurveY,
          );
        }
      } else {
        path.lineTo(endOffset.dx, endOffset.dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  void drawCurentLineAfterAcceptiong({
    required Canvas canvas,
    required Path path,
    required Paint paint,
  }) {
    if (lines.isEmpty) {
      return;
    }
    if ((lines[0].end.dy - lines[0].start.dy).abs() < 30) {
      path.moveTo(
        lines[0].start.dx - smallScreenWidthFactor,
        lines[0].start.dy - smallScreenHeightFactor,
      );
      path.lineTo(
        lines[0].end.dx - smallScreenWidthFactor,
        lines[0].end.dy - smallScreenHeightFactor,
      );
      canvas.drawPath(path, paint);

      return;
    }
    path.moveTo(
      lines[0].start.dx - smallScreenWidthFactor,
      lines[0].start.dy - smallScreenHeightFactor,
    );

    curveChangingOffset = generateCurvePoint(
      startOffset: offsetForKey(lines[0].startKey),
      endOffset: offsetForKey(lines[0].endKey),
      curveChangingOffset: curveChangingOffset,
    );

    path.quadraticBezierTo(
      controllX(offsetForKey(lines[0].startKey).dx, curveChangingOffset.dx),
      controllY(offsetForKey(lines[0].startKey).dy, curveChangingOffset.dy),
      curveChangingOffset.dx,
      curveChangingOffset.dy,
    );

    path.quadraticBezierTo(
      controllX(curveChangingOffset.dx, offsetForKey(lines[0].endKey).dx,
          other: true),
      controllY(curveChangingOffset.dy, offsetForKey(lines[0].endKey).dy,
          other: true),
      offsetForKey(lines[0].endKey).dx,
      offsetForKey(lines[0].endKey).dy,
    );

    canvas.drawPath(path, paint);
    return;
  }

  void drawSavedLines(
      {required Canvas canvas, required Path path, required Paint painte}) {
    savedLines.forEach((element) {
      final Paint paint = Paint()
        ..strokeWidth = 2
        ..color = element.color
        ..style = PaintingStyle.stroke;
      if ((element.line.end.dy - element.line.start.dy).abs() < 30) {
        path.moveTo(
          element.line.start.dx,
          element.line.end.dy,
        );
        // path.lineTo(
        //   element.line.end.dx,
        //   element.line.end.dy,
        // );
        path.moveTo(
          offsetForKey(element.line.startKey).dx,
          offsetForKey(element.line.startKey).dy,
        );
        path.lineTo(
          offsetForKey(element.line.endKey).dx,
          offsetForKey(element.line.endKey).dy,
        );

        canvas.drawPath(path, paint);
        return;
      }
      path.moveTo(
        offsetForKey(element.line.startKey).dx,
        offsetForKey(element.line.startKey).dy,
      );

      element.curveOffset = generateCurvePoint(
        startOffset: offsetForKey(element.line.startKey),
        endOffset: offsetForKey(element.line.endKey),
        curveChangingOffset: element.curveOffset,
      );

      path.quadraticBezierTo(
        controllX(
            offsetForKey(element.line.startKey).dx, element.curveOffset.dx),
        controllY(
            offsetForKey(element.line.startKey).dy, element.curveOffset.dy),
        element.curveOffset.dx,
        element.curveOffset.dy,
      );

      // path.quadraticBezierTo(
      //   controllX(element.curveOffset.dx, element.line.end.dx, other: true),
      //   controllY(element.curveOffset.dy, element.line.end.dy, other: true),
      //   element.line.end.dx,
      //   element.line.end.dy,
      // );
      //
      path.quadraticBezierTo(
        controllX(element.curveOffset.dx, element.line.end.dx, other: true),
        controllY(element.curveOffset.dy, element.line.end.dy, other: true),
        offsetForKey(element.line.endKey).dx,
        offsetForKey(element.line.endKey).dy,
      );
      //

      canvas.drawPath(path, paint);
      return;
    });
    return;
  }

  drawWithThreePoints() {
    // path.quadraticBezierTo(
    //   controllX(startOffset.dx, curveChangingOffset.dx),
    //   controllY(startOffset.dy, curveChangingOffset.dy),
    //   curveChangingOffset.dx,
    //   curveChangingOffset.dy,
    // );

    // path.quadraticBezierTo(
    //   controllX(curveChangingOffset.dx, endOffset.dx, other: true),
    //   controllY(curveChangingOffset.dy, endOffset.dy, other: true),
    //   endOffset.dx,
    //   endOffset.dy,
    // );
  }

  Offset generateCurvePoint({
    required Offset startOffset,
    required Offset endOffset,
    required Offset curveChangingOffset,
  }) {
    Offset cureveOffset;
    double newCurveY;
    if (endOffset.dy > startOffset.dy) {
      newCurveY =
          startOffset.dy + (endOffset.dy - curveChangingOffset.dy).abs() / 1.3;
    } else {
      newCurveY =
          startOffset.dy - (endOffset.dy - curveChangingOffset.dy).abs() / 1.3;
    }
    cureveOffset = Offset(
      startOffset.dx + ((endOffset.dx - startOffset.dx) / 2),
      newCurveY,
    );

    return cureveOffset;
  }

  double controllY(double startY, double endY, {bool other = false}) {
    double factor = 50;
    double different = (startY - endY).abs();
    double pointFactor = 40;

    //opposite case
    if (other) {
      if (endY > startY) {
        return endY - different / pointFactor;
      } else {
        return endY + different / pointFactor;
      }
    }

    return startY;
  }

  double controllX(double startX, double endX, {bool other = false}) {
    if (other) {
      return startX + (endX - startX) / 8;
    }
    return endX;
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
