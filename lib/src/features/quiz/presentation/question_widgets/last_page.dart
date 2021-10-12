import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';

class QuizLastPage extends StatefulWidget {
  int questionIndex;

  QuizLastPage({
    Key? key,
    required this.questionIndex,
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
              ? "Your score is score / 44"
              : 'Click the button to see the correct answers or go back to review your answers.'),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: QuizData.showRightAnswers
                  ? () {
                      setState(() {
                        widget.questionIndex = 0;
                      });
                    }
                  : () {
                      setState(() {
                        QuizData.checkUerAnswers();
                        QuizData.showRightAnswers = !QuizData.showRightAnswers;
                      });
                    },
              child: Text(QuizData.showRightAnswers ? "<<" : 'Show Answers'))
        ],
      ),
    );
  }
}
