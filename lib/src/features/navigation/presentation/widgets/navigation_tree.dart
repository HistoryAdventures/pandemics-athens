import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/leaf_detail_model.dart';
import 'drow_circle_line.dart';

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
  Color colorText = AppColors.grey35;
  @override
  void initState() {
    if (widget.isAbleToNavigate == false) {
      color = Colors.transparent;
    } else {
      color = AppColors.grey;
    }
    getTextColor();

    super.initState();
  }

  void getTextColor() {
    if (widget.isAbleToNavigate || widget.details.vertex.visited) {
      colorText = AppColors.black100;
    }
    if (widget.details.vertex.isCurrent) {
      colorText = AppColors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: getCoordinate(context).dx,
          top: getCoordinate(context).dy,
          child: Text(widget.details.title.toUpperCase(),
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: colorText, fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Positioned(
          left: widget.details.pointOffset.dx,
          top: widget.details.pointOffset.dy,
          child: Clickable(
            isAbleToPress:
                widget.isAbleToNavigate || widget.details.vertex.visited,
            onPressed: widget.isAbleToNavigate || widget.details.vertex.visited
                ? widget.onTap
                : null,
            child: Align(
              alignment: Alignment.center,
              child: CustomPaint(
                size: MediaQuery.of(context).size,
                painter: DrowCircleAndLine(
                  lineColor: widget.details.vertex.visited
                      ? AppColors.black100
                      : AppColors.grey35,
                  currentColorCircle: widget.details.vertex.isCurrent
                      ? AppColors.orange
                      : Colors.transparent,
                  currentColorCircleBorder: widget.details.vertex.isCurrent
                      ? AppColors.black100
                      : Colors.transparent,
                  colorIsAbleToNavigate: widget.isAbleToNavigate
                      ? AppColors.black100
                      : AppColors.grey35,
                  strat: widget.details.lineStartOffset,
                  end: widget.details.lineEndOffset,
                  circleColor: widget.details.vertex.visited
                      ? AppColors.black100
                      : AppColors.transpatent,
                  isAbleToNavigate: widget.isAbleToNavigate,
                  visited: widget.details.vertex.visited,
                ),
                child: const SizedBox(height: 10, width: 10),
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
      offset = Offset(widget.details.pointOffset.dx - size.width / 2 - 20,
          widget.details.pointOffset.dy + size.height + 2);
    } else if (widget.details.alignment == Alignment.topCenter) {
      offset = Offset(widget.details.pointOffset.dx - 5 - size.width / 2,
          widget.details.pointOffset.dy - size.height - 20);
    } // FIXME  DONE
    else if (widget.details.alignment == Alignment.centerLeft) {
      offset = Offset((widget.details.pointOffset.dx - 18 - size.width) - 40,
          (widget.details.pointOffset.dy - size.height / 4) + 1);
    } // FIXME  DONE
    else if (widget.details.alignment == Alignment.centerRight) {
      offset = Offset(widget.details.pointOffset.dx + 25,
          (widget.details.pointOffset.dy - size.height / 4) - 5);
    }
    return offset;
  }
}
