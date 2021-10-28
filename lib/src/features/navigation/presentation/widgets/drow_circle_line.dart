import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';

class DrowCircleAndLine extends CustomPainter {
  final Color colorIsAbleToNavigate;
  final Color lineColor;
  final Color currentColorCircle;
  final Color circleColor;
  final bool isAbleToNavigate;
  final bool visited;
  final Offset strat;
  final Offset end;

  DrowCircleAndLine(
      {required this.colorIsAbleToNavigate,
      required this.strat,
      required this.end,
      required this.isAbleToNavigate,
      required this.visited,
      required this.circleColor,
      required this.lineColor,
      required this.currentColorCircle});
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final circleSize = rect.width / 2;
    final area = circleSize * circleSize;
    final radiusCurrentCircle = sqrt(area * 2);

    final radiusPainCircle = sqrt(area);

    final paintCurrentCircle = Paint()
      ..color = currentColorCircle
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final paint2 = Paint()
      ..color = circleColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final paint3 = Paint()
      ..color = colorIsAbleToNavigate
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final a1 = strat;
    final a2 = end;
    final paintLine1 = Paint()
      ..color = colorIsAbleToNavigate
      ..strokeWidth = 1;

    final b1 = strat;
    final b2 = end;
    final paintLine2 = Paint()
      ..color = AppColors.grey35
      ..strokeWidth = 1;

    final c1 = strat;
    final c2 = end;
    final paintLine3 = Paint()
      ..color = AppColors.black100
      ..strokeWidth = 1;

    if (isAbleToNavigate) {
      _drawDashedLine(2, 2, a1, a2, canvas, size, paintLine1);
    } else if (visited) {
      canvas.drawLine(c1, c2, paintLine3);
    } else {
      canvas.drawLine(b1, b2, paintLine2);
    }

    canvas.drawCircle(rect.center, radiusPainCircle, paint3);
    canvas.drawCircle(rect.center, radiusPainCircle, paint2);
    canvas.drawCircle(rect.center, radiusCurrentCircle, paintCurrentCircle);
  }

  @override
  bool shouldRepaint(DrowCircleAndLine oldDelegate) => true;
}

void _drawDashedLine(double dashLength, double dashSpace, Offset firstOffset,
    Offset secondOffset, Canvas canvas, Size size, Paint paint) {
  var startOffset = firstOffset;

  var intervals = _getDirectionVector(firstOffset, secondOffset).length /
      (dashLength + dashSpace);

  for (var i = 0; i < intervals; i++) {
    var endOffset = _getNextOffset(startOffset, secondOffset, dashLength);

    /// Draw a small line.
    canvas.drawLine(startOffset, endOffset, paint);

    /// Update the starting offset.
    startOffset = _getNextOffset(endOffset, secondOffset, dashSpace);
  }
}

Offset _getNextOffset(
  Offset firstOffset,
  Offset secondOffset,
  double smallVectorLength,
) {
  var directionVector = _getDirectionVector(firstOffset, secondOffset);

  var rescaleFactor = smallVectorLength / directionVector.length;
  if (rescaleFactor.isNaN || rescaleFactor.isInfinite) {
    rescaleFactor = 1;
  }

  var rescaledVector = Offset(directionVector.vector.dx * rescaleFactor,
      directionVector.vector.dy * rescaleFactor);

  var newOffset = Offset(
      firstOffset.dx + rescaledVector.dx, firstOffset.dy + rescaledVector.dy);

  return newOffset;
}

DirectionVector _getDirectionVector(Offset firstVector, Offset secondVector) {
  var directionVector = Offset(
      secondVector.dx - firstVector.dx, secondVector.dy - firstVector.dy);

  var directionVectorLength =
      sqrt(pow(directionVector.dx, 2) + pow(directionVector.dy, 2));

  return DirectionVector(
    vector: directionVector,
    length: directionVectorLength,
  );
}

class DirectionVector {
  final Offset vector;
  final double length;

  const DirectionVector({
    required this.vector,
    required this.length,
  });
}
