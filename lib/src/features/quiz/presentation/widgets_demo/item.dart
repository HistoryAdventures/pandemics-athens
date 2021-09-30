import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'answer.dart';
import 'image_answer.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: AutoSizeText(
              questionData[index].question as String,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        ...questionData[index]
            .answers
            .map((val) => Flexible(
                  child: Answer(
                    title: val['answer'] as String,
                    onChangeAnswer: onChangeAnswer,
                    isCorrect: val.containsKey('isCorrect') as bool,
                  ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 5,
            ),
            //padding: const EdgeInsets.all(10),
            child: AutoSizeText(
              questionData[index].question as String,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        ...questionData[index]
            .answers
            .map((val) => Flexible(
                  child: ImageAnswer(
                    title: val['answer'] as String,
                    onChangeAnswer: onChangeAnswer,
                    isCorrect: val.containsKey('isCorrect') as bool,
                  ),
                ))
            .toList(),
      ],
    );
  }
}
