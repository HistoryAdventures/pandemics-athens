import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class Answers<T> {
  T value;
  final String text;
  CorrectAnswers? correctAnswers;
  GlobalKey? globalKey;

  Answers(
      {required this.value,
      required this.text,
      this.correctAnswers,
      this.globalKey});
}
