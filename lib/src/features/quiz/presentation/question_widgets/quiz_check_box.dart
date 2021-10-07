import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/check_box.dart';

class QuizCheckBox extends StatefulWidget {
  final int questionIndex;
  final String question;
  final List<Answers<bool>> answers;
  QuizCheckBox(
      {Key? key,
      required this.questionIndex,
      required this.question,
      required this.answers})
      : super(key: key);

  @override
  _QuizCheckBoxState createState() => _QuizCheckBoxState();
}

class _QuizCheckBoxState extends State<QuizCheckBox> {
  //bool val = false;
  @override
  void dispose() {
    print(QuizData.usersAnswersForQ8);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.01),
              child: Text(
                'QUESTION ${widget.questionIndex}',
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Text(
              widget.question,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: TextFontSize.getHeight(45, context)),
            ),
            Column(
              children: [
                ...widget.answers
                    .map((answers) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: CheckboxText(
                          value: answers.value,
                          text: answers.text,
                          onTap: (val) {
                            if (val) {
                              QuizData.usersAnswersForQ8
                                  .remove(answers.correctAnswers);
                            } else {
                              QuizData.usersAnswersForQ8
                                  .add(answers.correctAnswers!);
                            }
                            setState(() {
                              answers.value = !answers.value;
                            });
                          },
                        )))
                    .toList()
              ],
            )
          ],
        ),
      );
    });
  }
}
