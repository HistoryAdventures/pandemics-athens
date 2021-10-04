import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';

class Answers {
  final int value;
  final String text;
  CorrectAnswers? correctAnswers;

  Answers({required this.value, required this.text, this.correctAnswers});
}
