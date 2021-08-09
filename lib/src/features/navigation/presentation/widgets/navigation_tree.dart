import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/string_utils.dart';

class NavigationTree extends StatefulWidget {
  final LeafDetails details;
  final VoidCallback onTap;
  final bool isAbleToNavigate;

  const NavigationTree({
    Key? key,
    required this.details,
    required this.onTap,
    required this.isAbleToNavigate,
  }) : super(key: key);

  @override
  _NavigationTreeState createState() => _NavigationTreeState();
}

class _NavigationTreeState extends State<NavigationTree> {
  Color color = AppColors.orange;
  @override
  void initState() {
    if (widget.isAbleToNavigate == false) {
      color = Colors.black;
    } else {
      color = AppColors.orange;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: getCoordinate(context).dx,
          top: getCoordinate(context).dy,
          child: Text(widget.details.title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1
                  ?.copyWith(color: AppColors.black54, fontSize: 10)),
        ),
        Positioned(
          left: widget.details.pointOffset.dx,
          top: widget.details.pointOffset.dy,
          child: Clickable(
            onPressed: widget.isAbleToNavigate ? widget.onTap : () {},
            child: Align(
              alignment: Alignment.center,
              child: CustomPaint(
                size: MediaQuery.of(context).size,
                painter: DrowCircleAndLine(
                    currentColor: widget.details.vertex.isCurrent
                        ? Colors.white
                        : Colors.transparent,
                    color: widget.details.vertex.visited ? Colors.white : color,
                    strat: widget.details.lineStartOffset,
                    end: widget.details.lineEndOffset),
                child: const SizedBox(height: 15, width: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Offset getCoordinate(BuildContext context) {
    // Text offset
    Offset offset = Offset.zero;
    // The size of the title text
    final size = StringUtils.measure(widget.details.title,
        Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 10));

    if (widget.details.alignment == Alignment.bottomCenter) {
      offset = Offset(widget.details.pointOffset.dx + 7.5 - size.width / 2,
          widget.details.pointOffset.dy + size.height + 10);
    } else if (widget.details.alignment == Alignment.topCenter) {
      offset = Offset(widget.details.pointOffset.dx + 7.5 - size.width / 2,
          widget.details.pointOffset.dy - size.height - 5);
    } // FIXME  DONE
    else if (widget.details.alignment == Alignment.centerLeft) {
      offset = Offset((widget.details.pointOffset.dx - size.width) - 10,
          (widget.details.pointOffset.dy - size.height / 4) + 5);
    } // FIXME  DONE
    else if (widget.details.alignment == Alignment.centerRight) {
      offset = Offset(widget.details.pointOffset.dx + 25,
          (widget.details.pointOffset.dy - size.height / 4) + 5);
    }
    return offset;
  }
}

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

class LeafDetails {
  final Vertex vertex;
  final Offset pointOffset;
  final Offset lineStartOffset;
  final Offset lineEndOffset;
  final Alignment alignment;
  final String title;
  final VoidCallback onTap;

  static List<int> visitedVertexes = [0];
  static int currentVertex = 0;

  const LeafDetails(
    this.vertex, {
    required this.pointOffset,
    required this.onTap,
    this.lineStartOffset = Offset.zero,
    this.lineEndOffset = Offset.zero,
    this.alignment = Alignment.bottomCenter,
    required this.title,
  });
}

class Vertex {
  final int index;
  final int currentVertex;
  final bool visited;
  final String path;
  final List<int> adjacentEdges;
  bool isCurrent = false;
  Vertex({
    required this.index,
    required this.visited,
    required this.path,
    required this.currentVertex,
    this.adjacentEdges = const [],
  }) : isCurrent = currentVertex == index;
}
