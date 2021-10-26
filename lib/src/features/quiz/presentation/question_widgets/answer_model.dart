import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class Answers<T> {
  T value;
  final String text;
  CorrectAnswers? correctAnswers;
  GlobalKey? globalKey;
  Color circleColor = AppColors.white;

  Answers(
      {required this.value,
      required this.text,
      this.correctAnswers,
      this.circleColor = AppColors.white,
      this.globalKey});
}
