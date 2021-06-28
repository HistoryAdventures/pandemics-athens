import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/widgets/answer.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/widgets/image_answer.dart';

class Quiz extends StatelessWidget {
  final int index;
  final List<dynamic> questionData;
  final Function onChangeAnswer;

  const Quiz(
      {required this.index,
      required this.onChangeAnswer,
      required this.questionData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            questionData[index].question as String,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ...questionData[index]
            .answers
            .map((val) => Answer(
                  title: val['answer'] as String,
                  onChangeAnswer: onChangeAnswer,
                  isCorrect:
                      val.containsKey('isCorrect') as bool ? true : false,
                ))
            .toList(),
      ],
    );
  }
}

class QuizImage extends StatelessWidget {
  final int index;
  final List<dynamic> questionData;
  final Function onChangeAnswer;

  const QuizImage(
      {required this.index,
      required this.onChangeAnswer,
      required this.questionData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            questionData[index].question as String,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ...questionData[index]
            .answers
            .map((val) => ImageAnswer(
                  title: val['answer'] as String,
                  onChangeAnswer: onChangeAnswer,
                  isCorrect:
                      (val.containsKey('isCorrect') as bool) ? true : false,
                ))
            .toList(),
      ],
    );
  }
}
