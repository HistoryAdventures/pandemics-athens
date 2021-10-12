import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/show_dialog.dart';

class QuizLastPage extends StatefulWidget {
  void Function()? onPressed;
  QuizLastPage({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  _QuizLastPageState createState() => _QuizLastPageState();
}

class _QuizLastPageState extends State<QuizLastPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text(QuizData.showRightAnswers
              ? "Your score is: ${QuizData.finalScore} / 44"
              : 'Click the button to see the correct answers or go back to review your answers.'),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: widget.onPressed,
              child: Text(QuizData.showRightAnswers ? "<<" : 'Show Answers'))
        ],
      ),
    );
  }
}
