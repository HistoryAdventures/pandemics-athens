import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class DraggableCirclesWidget extends StatefulWidget {
  final Answers answer;
  final Offset offset;
  final Function(Offset) getStartLineOffset;
  final Function(Offset) getEndLineOffset;
  final Function() onDragCompleted;
  final Function(DraggableDetails) onDragEnd;

  DraggableCirclesWidget(
      {required this.answer,
      required this.offset,
      required this.onDragEnd,
      required this.onDragCompleted,
      required this.getStartLineOffset,
      required this.getEndLineOffset});

  @override
  _DraggableCirclesWidgetState createState() => _DraggableCirclesWidgetState();
}

class _DraggableCirclesWidgetState extends State<DraggableCirclesWidget> {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            child: Draggable<Answers>(
              onDragStarted: () {
                // print('start::::: $offset');
                widget.getStartLineOffset(widget.offset);
              },
              onDragCompleted: () {
                widget.answer.circleColor = AppColors.orange;

                widget.onDragCompleted();
                // print('on Drag Complete');
              },
              onDragEnd: (data) {
                widget.getEndLineOffset(data.offset);
                // print('end::::: ${data.offset}');
                widget.onDragEnd(data);
              },
              data: widget.answer,
              feedback: Material(
                color: Colors.transparent,
                child: Container(
                  child: buildText(context, widget.answer.text, false,
                      widget.answer.circleColor),
                ),
              ),
              child: buildText(
                  context, widget.answer.text, true, widget.answer.circleColor),
              //childWhenDragging: Container(height: size),
            ),
          ),
        ],
      );

  Widget buildText(
          BuildContext context, String text, bool isFeedBak, Color colors) =>
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey, width: 1.5),
          color: colors,
        ),
      );
}
