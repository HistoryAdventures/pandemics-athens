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
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Clickable(
            isAbleToPress:
                widget.isAbleToNavigate || widget.details.vertex.visited,
            onPressed: widget.isAbleToNavigate || widget.details.vertex.visited
                ? widget.onTap
                : null,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 3,
                          color: widget.details.vertex.isCurrent
                              ? AppColors.orange
                              : AppColors.transpatent))),
              child: Text(
                widget.details.numberOfChapter,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
