import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class Answers<T> {
  T value;
  String? text;
  CorrectAnswers? correctAnswers;
  GlobalKey? globalKey;
  Color circleColor = AppColors.white;
  String? image;
  bool? checked;
  bool? isCorrect;

  Answers(
      {required this.value,
      this.text,
      this.checked,
      this.correctAnswers,
      this.circleColor = AppColors.white,
      this.isCorrect,
      this.globalKey,
      this.image});
}
