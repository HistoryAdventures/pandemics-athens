import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/data/model/quiz_model.dart';

class DraggableWidget extends StatelessWidget {
  final AnswerText animal;

  const DraggableWidget({
    required this.animal,
  });

  @override
  Widget build(BuildContext context) => Draggable<AnswerText>(
        data: animal,
        feedback: Material(child: buildImage()),
        child: buildImage(),
        //childWhenDragging: Container(height: size),
      );

  Widget buildImage() => Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Text(
          animal.answers,
          textAlign: TextAlign.center,
        ),
      );
}
