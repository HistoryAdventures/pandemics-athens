import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class Answers<T> {
  T value;
  final String text;
  CorrectAnswers? correctAnswers;

  Answers({required this.value, required this.text, this.correctAnswers});
}
