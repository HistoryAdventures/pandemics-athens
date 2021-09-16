import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/chapter_tree.dart';
import 'drow_circle_line.dart';

class ChapterNavigationTree extends StatefulWidget {
  final ChapterDetails details;
  final VoidCallback onTap;
  final bool isAbleToNavigate;

  const ChapterNavigationTree({
    Key? key,
    required this.details,
    required this.onTap,
    required this.isAbleToNavigate,
  }) : super(key: key);

  @override
  _ChapterNavigationTreeState createState() => _ChapterNavigationTreeState();
}

class _ChapterNavigationTreeState extends State<ChapterNavigationTree> {
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        children: [
          Text(widget.details.numberOfChapter),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Clickable(
              isAbleToPress:
                  widget.isAbleToNavigate || widget.details.vertex.visited,
              onPressed:
                  widget.isAbleToNavigate || widget.details.vertex.visited
                      ? widget.onTap
                      : null,
              child: SizedBox(
                child: CustomPaint(
                  painter: DrowCircleAndLine(
                    currentColor: widget.details.vertex.isCurrent
                        ? Colors.white
                        : Colors.transparent,
                    color: widget.details.vertex.visited ? Colors.white : color,
                    strat: widget.details.start ?? const Offset(8, 30),
                    end: widget.details.end ?? const Offset(8, 60),
                  ),
                  child: const SizedBox(
                    height: 15,
                    width: 15,
                    child: Center(
                      child: Text(
                        "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(widget.details.nameOfChapter),
        ],
      ),
    );
  }
}
